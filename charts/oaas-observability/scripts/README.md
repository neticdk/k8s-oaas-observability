# Netic OaaS Scripts

A collection of scripts related to the chart generating Prometheus alerts and recording rules and matching
Grafana dashboards using selected jsonnet mixins.

_Note_ when developing the chart locally it is required to also run the generation of recording and alerting rules.

The following tools are required to run the generation of recording and alerting rules:
- jsonnet
- jb (jsonnet bundler)

It is recommended to use the Go version of the tools which can be installed as follows.

```bash
$ go get github.com/google/go-jsonnet/cmd/jsonnet
$ go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb
```

(remember to add the Go bin directory to your path, e.g., `export PATH=$PATH:$(go env GOPATH)/bin` for Bourne Shell compatibles)

Rendering all of the rules and dashboar files may then be done running the `update-rules.sh` script like so:

```bash
$ ./update-rules.sh
../k8s-oaas-observability/charts/netic-oaas/scripts ../k8s-oaas-observability
GET https://github.com/kubernetes-monitoring/kubernetes-mixin/archive/b48b30b908f5dbd283b80803843f07b96ab594f7.tar.gz 200
GET https://github.com/etcd-io/etcd/archive/07c15890ab297947569b221c45aff0688bb20263.tar.gz 200
GET https://github.com/grafana/grafonnet-lib/archive/356bd73e4792ffe107725776ca8946895969c191.tar.gz 200
GET https://github.com/grafana/jsonnet-libs/archive/e53507e410f1dbdc0bf9aee03b558437a40b248e.tar.gz 200
Generating Kubernetes recording rules
Generating Kubernetes alerting rules
Generating etcd alerting rules
Generating Kubernetes Grafana dashboards
../files/dashboards/k8s-mixin/apiserver.json
../files/dashboards/k8s-mixin/cluster-total.json
../files/dashboards/k8s-mixin/controller-manager.json
../files/dashboards/k8s-mixin/k8s-resources-cluster.json
../files/dashboards/k8s-mixin/k8s-resources-namespace.json
../files/dashboards/k8s-mixin/k8s-resources-node.json
../files/dashboards/k8s-mixin/k8s-resources-pod.json
../files/dashboards/k8s-mixin/k8s-resources-workload.json
../files/dashboards/k8s-mixin/k8s-resources-workloads-namespace.json
../files/dashboards/k8s-mixin/kubelet.json
../files/dashboards/k8s-mixin/namespace-by-pod.json
../files/dashboards/k8s-mixin/namespace-by-workload.json
../files/dashboards/k8s-mixin/persistentvolumesusage.json
../files/dashboards/k8s-mixin/pod-total.json
../files/dashboards/k8s-mixin/proxy.json
../files/dashboards/k8s-mixin/scheduler.json
../files/dashboards/k8s-mixin/statefulset.json
../files/dashboards/k8s-mixin/workload-total.json
Generating etcd Grafana dashboards
../files/dashboards/etcd-mixin/etcd.json
../k8s-oaas-observability
```
