package controller

import (
	"context"
	"fmt"
	"time"

	"github.com/pkg/errors"
	corev1 "k8s.io/api/core/v1"
	apierrors "k8s.io/apimachinery/pkg/api/errors"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	utilruntime "k8s.io/apimachinery/pkg/util/runtime"
	"k8s.io/apimachinery/pkg/util/wait"
	informers "k8s.io/client-go/informers/core/v1"
	"k8s.io/client-go/kubernetes"
	listers "k8s.io/client-go/listers/core/v1"
	"k8s.io/client-go/tools/cache"
	"k8s.io/client-go/util/workqueue"
	"k8s.io/klog/v2"
)

const (
	controllerName = "endpoint-controller"

	controlplaneLabel = "node-role.kubernetes.io/controlplane"
	kubeSchedulerPort = 10251
	kubeCMPort        = 10252

	etcdLabel = "node-role.kubernetes.io/etcd"
	etcdPort  = 2381

	osLabel      = "kubernetes.io/os"
	exporterPort = 9100
)

// Controller is the controller implementation
type Controller struct {
	clientset        kubernetes.Interface
	nodes            listers.NodeLister
	nodesSynced      cache.InformerSynced
	queue            workqueue.RateLimitingInterface
	kubeSchedulerKey string
	kubeCMKey        string
	etcdKey          string
	osKey            string
}

// NewController returns a new controller instance
func NewController(clientset kubernetes.Interface, nodes informers.NodeInformer, kubeSchedulerKey, kubeCMKey, etcdKey, osKey string) *Controller {
	c := &Controller{
		clientset:        clientset,
		nodes:            nodes.Lister(),
		nodesSynced:      nodes.Informer().HasSynced,
		queue:            workqueue.NewNamedRateLimitingQueue(workqueue.DefaultControllerRateLimiter(), controllerName),
		kubeSchedulerKey: kubeSchedulerKey,
		kubeCMKey:        kubeCMKey,
		etcdKey:          etcdKey,
		osKey:            osKey,
	}

	nodes.Informer().AddEventHandler(cache.ResourceEventHandlerFuncs{
		AddFunc: func(obj interface{}) {
			key, err := cache.MetaNamespaceKeyFunc(obj)
			if err == nil {
				c.queue.Add(key)
			}
		},
		UpdateFunc: func(old interface{}, new interface{}) {
			key, err := cache.MetaNamespaceKeyFunc(new)
			if err == nil {
				c.queue.Add(key)
			}
		},
		DeleteFunc: func(obj interface{}) {
			key, err := cache.DeletionHandlingMetaNamespaceKeyFunc(obj)
			if err == nil {
				c.queue.Add(key)
			}
		},
	})

	return c
}

// Run starts the controller
func (c *Controller) Run(threadiness int, stopCh <-chan struct{}) {
	defer utilruntime.HandleCrash()
	defer c.queue.ShutDown()

	klog.Infof("Starting %s", controllerName)

	if !cache.WaitForNamedCacheSync(controllerName, stopCh, c.nodesSynced) {
		return
	}

	for i := 0; i < threadiness; i++ {
		go wait.Until(c.runWorker, time.Second, stopCh)
	}

	<-stopCh
	klog.Infof("Shutting down %s", controllerName)
}

func (c *Controller) runWorker() {
	for c.processNextWorkItem() {
	}
}

func (c *Controller) processNextWorkItem() bool {
	key, quit := c.queue.Get()
	if quit {
		return false
	}
	defer c.queue.Done(key)

	err := c.syncHandler(key.(string))
	if err == nil {
		c.queue.Forget(key)
		return true
	}

	utilruntime.HandleError(fmt.Errorf("%v failed with : %v", key, err))
	c.queue.AddRateLimited(key)

	return true
}

func (c *Controller) syncHandler(key string) error {
	ctx := context.TODO()

	_, name, err := cache.SplitMetaNamespaceKey(key)
	if err != nil {
		utilruntime.HandleError(fmt.Errorf("invalid resource key: %s", key))
		return nil
	}

	node, err := c.nodes.Get(name)
	if err != nil {
		utilruntime.HandleError(fmt.Errorf("unable to get node: %s", name))
		return err
	}

	labels := node.GetLabels()
	if _, ok := labels[etcdLabel]; ok && len(c.etcdKey) > 0 {
		svcNs, svcName, _ := cache.SplitMetaNamespaceKey(c.etcdKey)
		err := c.syncObjects(ctx, svcNs, svcName, etcdPort, "kube-etcd", etcdLabel, "true")
		if err != nil {
			return err
		}
	}

	if _, ok := labels[controlplaneLabel]; ok {
		if len(c.kubeSchedulerKey) > 0 {
			svcNs, svcName, _ := cache.SplitMetaNamespaceKey(c.kubeSchedulerKey)
			err := c.syncObjects(ctx, svcNs, svcName, kubeSchedulerPort, "kube-scheduler", controlplaneLabel, "true")
			if err != nil {
				return err
			}
		}

		if len(c.kubeCMKey) > 0 {
			svcNs, svcName, _ := cache.SplitMetaNamespaceKey(c.kubeCMKey)
			err = c.syncObjects(ctx, svcNs, svcName, kubeCMPort, "kube-controller-manager", controlplaneLabel, "true")
			if err != nil {
				return err
			}
		}
	}

	if os, ok := labels[osLabel]; ok && os == "windows" && len(c.osKey) > 0 {
		svcNs, svcName, _ := cache.SplitMetaNamespaceKey(c.osKey)
		err = c.syncObjects(ctx, svcNs, svcName, exporterPort, "windows-exporter", osLabel, os)
		if err != nil {
			return err
		}
	}

	return nil
}

func (c *Controller) syncObjects(ctx context.Context, svcNs string, svcName string, port int32, component string, nodeLabel, labelValue string) error {
	list, err := c.clientset.CoreV1().Nodes().List(ctx, metav1.ListOptions{
		LabelSelector: fmt.Sprintf("%s=%s", nodeLabel, labelValue),
	})
	if err != nil {
		utilruntime.HandleError(fmt.Errorf("unable to list nodes with label: %s and value: %s", nodeLabel, labelValue))
		return err
	}

	if len(list.Items) == 0 {
		klog.Warningf("no nodes returned, unable to create or update ednpoints: %s", nodeLabel)
		return nil
	}

	addresses, errs := getNodeAddresses(list)
	if len(errs) > 0 {
		utilruntime.HandleError(fmt.Errorf("unable to resolve all node addresses"))
	}

	labels := map[string]string{
		"app.kubernetes.io/name":       controllerName,
		"app.kubernetes.io/managed-by": controllerName,
		"app.kubernetes.io/component":  component,
	}

	endpoint := &corev1.Endpoints{
		ObjectMeta: metav1.ObjectMeta{
			Name:   svcName,
			Labels: labels,
		},
		Subsets: []corev1.EndpointSubset{
			{
				Ports: []corev1.EndpointPort{
					{
						Name: "http-metrics",
						Port: port,
					},
				},
				Addresses: addresses,
			},
		},
	}

	currentEndpoint, err := c.clientset.CoreV1().Endpoints(svcNs).Get(ctx, svcName, metav1.GetOptions{})
	if err != nil && !apierrors.IsNotFound(err) {
		utilruntime.HandleError(fmt.Errorf("unable to retrieve endpoint object: %s", svcName))
		return err
	}
	if apierrors.IsNotFound(err) {
		_, err = c.clientset.CoreV1().Endpoints(svcNs).Create(ctx, endpoint, metav1.CreateOptions{})
		if err != nil {
			utilruntime.HandleError(fmt.Errorf("unable to create endpoints object: %s", svcName))
			return err
		}
	} else {
		endpoint.ResourceVersion = currentEndpoint.ResourceVersion
		_, err = c.clientset.CoreV1().Endpoints(svcNs).Update(ctx, endpoint, metav1.UpdateOptions{})
		if err != nil {
			utilruntime.HandleError(fmt.Errorf("unable to update endpoints object: %s", svcName))
			return err
		}
	}

	service := &corev1.Service{
		ObjectMeta: metav1.ObjectMeta{
			Name:   svcName,
			Labels: labels,
		},
		Spec: corev1.ServiceSpec{
			Type:      corev1.ServiceTypeClusterIP,
			ClusterIP: "None",
			Ports: []corev1.ServicePort{
				{
					Name: "http-metrics",
					Port: port,
				},
			},
		},
	}

	currentService, err := c.clientset.CoreV1().Services(svcNs).Get(ctx, svcName, metav1.GetOptions{})
	if err != nil && !apierrors.IsNotFound(err) {
		utilruntime.HandleError(errors.Wrap(err, "retrieving service object failed"))
		return nil
	}
	if apierrors.IsNotFound(err) {
		_, err = c.clientset.CoreV1().Services(svcNs).Create(ctx, service, metav1.CreateOptions{})
		if err != nil {
			utilruntime.HandleError(fmt.Errorf("unable to create service object: %s", svcName))
			return err
		}
	} else {
		service.ResourceVersion = currentService.ResourceVersion
		_, err := c.clientset.CoreV1().Services(svcNs).Update(ctx, service, metav1.UpdateOptions{})
		if err != nil {
			utilruntime.HandleError(fmt.Errorf("unable to update service object: %s", svcName))
			return err
		}
	}

	return nil
}

func nodeAddress(node corev1.Node) (string, map[corev1.NodeAddressType][]string, error) {
	m := map[corev1.NodeAddressType][]string{}
	for _, a := range node.Status.Addresses {
		m[a.Type] = append(m[a.Type], a.Address)
	}

	if addresses, ok := m[corev1.NodeInternalIP]; ok {
		return addresses[0], m, nil
	}
	if addresses, ok := m[corev1.NodeExternalIP]; ok {
		return addresses[0], m, nil
	}
	return "", m, fmt.Errorf("host address unknown")
}

// mimics the way this is done by Prometheus and Prometheus operator
func getNodeAddresses(nodes *corev1.NodeList) ([]corev1.EndpointAddress, []error) {
	addresses := make([]corev1.EndpointAddress, 0)
	errs := make([]error, 0)

	for _, n := range nodes.Items {
		address, _, err := nodeAddress(n)
		if err != nil {
			errs = append(errs, errors.Wrapf(err, "failed to determine hostname for node (%s)", n.Name))
			continue
		}
		addresses = append(addresses, corev1.EndpointAddress{
			IP: address,
			TargetRef: &corev1.ObjectReference{
				Kind:       "Node",
				Name:       n.Name,
				UID:        n.UID,
				APIVersion: n.APIVersion,
			},
		})
	}

	return addresses, errs
}
