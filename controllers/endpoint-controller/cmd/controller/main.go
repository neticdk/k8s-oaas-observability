package main

import (
	"flag"
	"time"

	"k8s.io/client-go/informers"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/tools/clientcmd"
	"k8s.io/klog/v2"
	"netic.dk/endpoint-controller/pkg/controller"
	"netic.dk/endpoint-controller/pkg/signals"
)

var (
	masterURL        string
	kubeconfig       string
	kubeSchedulerKey string
	kubeCMKey        string
	etcdKey          string
	osKey            string
)

func main() {
	klog.InitFlags(nil)
	flag.Parse()

	stopCh := signals.SetupSignalHandler()

	cfg, err := clientcmd.BuildConfigFromFlags(masterURL, kubeconfig)
	if err != nil {
		klog.Fatalf("Error building kubeconfig: %s", err.Error())
	}

	kubeClient, err := kubernetes.NewForConfig(cfg)
	if err != nil {
		klog.Fatalf("Error building kubernetes clientset: %s", err.Error())
	}

	informerFactory := informers.NewSharedInformerFactory(kubeClient, time.Second*30)
	controller := controller.NewController(kubeClient, informerFactory.Core().V1().Nodes(), kubeSchedulerKey, kubeCMKey, etcdKey, osKey)

	informerFactory.Start(stopCh)
	controller.Run(2, stopCh)
}

func init() {
	flag.StringVar(&kubeconfig, "kubeconfig", "", "Path to a kubeconfig. Only required if out-of-cluster.")
	flag.StringVar(&masterURL, "master", "", "The address of the Kubernetes API server. Overrides any value in kubeconfig. Only required if out-of-cluster.")
	flag.StringVar(&kubeSchedulerKey, "kube-scheduler-service", "", "Service/Endpoints object to write for kube-scheduler in format \"namespace/name\"")
	flag.StringVar(&kubeCMKey, "kube-controller-manager-service", "", "Service/Endpoints object to write for kube-controller-manager in format \"namespace/name\"")
	flag.StringVar(&etcdKey, "etcd-service", "", "Service/Endpoints object to write for etcd in format \"namespace/name\"")
	flag.StringVar(&osKey, "windows-exporter-service", "", "Service/Endpoints object to write for windows-exporter in format \"namespace/name\"")
}
