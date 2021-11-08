package controller

import (
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/client-go/informers"
	"k8s.io/client-go/kubernetes/fake"
	clienttesting "k8s.io/client-go/testing"
)

var (
	alwaysReady        = func() bool { return true }
	noResyncPeriodFunc = func() time.Duration { return 0 }
)

type fixture struct {
	t *testing.T

	client  *fake.Clientset
	nodes   []*corev1.Node
	objects []runtime.Object
}

func newFixture(t *testing.T) *fixture {
	f := &fixture{
		t: t,
	}
	return f
}

func (f *fixture) newController() *Controller {
	f.client = fake.NewSimpleClientset(f.objects...)
	i := informers.NewSharedInformerFactory(f.client, noResyncPeriodFunc())
	c := NewController(f.client,
		i.Core().V1().Nodes(),
		"kube-system/kube-scheduler",
		"kube-system/kube-controller-manager",
		"kube-system/etcd",
		"kube-system/windows-exporter")
	c.nodesSynced = alwaysReady
	for _, n := range f.nodes {
		i.Core().V1().Nodes().Informer().GetIndexer().Add(n)
	}
	return c
}

func (f *fixture) run(node string) {
	c := f.newController()
	c.syncHandler(node)
}

func TestCreateKubeEndpoints(t *testing.T) {
	f := newFixture(t)

	n := &corev1.Node{
		ObjectMeta: metav1.ObjectMeta{
			Name: "node-name",
			Labels: map[string]string{
				"node-role.kubernetes.io/controlplane": "true",
			},
		},
		Spec: corev1.NodeSpec{},
		Status: corev1.NodeStatus{
			Addresses: []corev1.NodeAddress{
				{
					Type:    corev1.NodeInternalIP,
					Address: "10.10.10.10",
				},
			},
		},
	}
	f.nodes = append(f.nodes, n)
	f.objects = append(f.objects, n)

	f.run("node-name")

	assert.Len(t, f.client.Actions(), 10)
	a := f.client.Actions()
	assert.IsType(t, clienttesting.CreateActionImpl{}, a[2]) // Create Endpoint
	assert.IsType(t, clienttesting.CreateActionImpl{}, a[4]) // Create Service
	assert.IsType(t, clienttesting.CreateActionImpl{}, a[7]) // Create Endpoint
	assert.IsType(t, clienttesting.CreateActionImpl{}, a[9]) // Create Service
}

func TestCreateEtcdEndpoints(t *testing.T) {
	f := newFixture(t)

	n := &corev1.Node{
		ObjectMeta: metav1.ObjectMeta{
			Name: "node-name",
			Labels: map[string]string{
				"node-role.kubernetes.io/etcd": "true",
			},
		},
		Spec: corev1.NodeSpec{},
		Status: corev1.NodeStatus{
			Addresses: []corev1.NodeAddress{
				{
					Type:    corev1.NodeInternalIP,
					Address: "10.10.10.10",
				},
			},
		},
	}
	f.nodes = append(f.nodes, n)
	f.objects = append(f.objects, n)

	f.run("node-name")

	assert.Len(t, f.client.Actions(), 5)
	a := f.client.Actions()
	assert.IsType(t, clienttesting.CreateActionImpl{}, a[2]) // Create Endpoint
	assert.IsType(t, clienttesting.CreateActionImpl{}, a[4]) // Create Service
}

func TestCreateWindowsExporterEndpoints(t *testing.T) {
	f := newFixture(t)

	n := &corev1.Node{
		ObjectMeta: metav1.ObjectMeta{
			Name: "node-name",
			Labels: map[string]string{
				"kubernetes.io/os": "windows",
			},
		},
		Spec: corev1.NodeSpec{},
		Status: corev1.NodeStatus{
			Addresses: []corev1.NodeAddress{
				{
					Type:    corev1.NodeInternalIP,
					Address: "10.10.10.10",
				},
			},
		},
	}
	f.nodes = append(f.nodes, n)
	f.objects = append(f.objects, n)

	f.run("node-name")

	assert.Len(t, f.client.Actions(), 5)
	a := f.client.Actions()
	assert.IsType(t, clienttesting.CreateActionImpl{}, a[2]) // Create Endpoint
	assert.IsType(t, clienttesting.CreateActionImpl{}, a[4]) // Create Service
}
