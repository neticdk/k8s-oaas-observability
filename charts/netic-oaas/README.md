# Netic Operation as a Service (OaaS)

The chart installs observability stack to monitor Kubernetes utility cluster.

## To try this out in a local cluster:
Starting up a kind cluster can be done based on the cluster definition `local/kind-cluster.yaml`.

## Working Locally

The chart can be tested locally using Kubernetes in Docker (kind) and Docker compose (simulating
Netic data collection). All the following commands assume current directory is the chart root.

### installation requirements
First make sure that:
 - external rules and dashboards are downloaded. 
 - kind is installed
 - kubectl is installed
 - helm is installed
 - jsonnet is installed
As the external templates are based on `jsonnet` and thus this needs to be available.

```bash
#install kubectl, helm, kind, go
# and assuming $GOPATH/bin is in path install jsonnet
$ go get github.com/google/go-jsonnet/cmd/jsonnet
$ go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb
$ ./ci/update-rules.sh
```
or using brew:
```bash
brew install kubectl
brew install helm
brew install kind
brew install jsonnet
```

Starting up a local kind cluster on the cluster definition `local/kind-cluster.yaml`.

### Create the local cluster
```bash
$ kind create cluster --name oaas --config local/kind-cluster.yaml
```
### Access the created local kind cluster
```bash
$ kubectl cluster-info --context kind-oaas
```

### Manually create the desired namespace in the created local kind cluster
```bash
$ kubectl create ns netic-oaas-system
$ kubectl get ns
```

### Initialize Helm (if this is first time running this).
```bash
$ helm repo add grafana https://grafana.github.io/helm-charts
```

### Update Helm dependencies
```bash
$ cd charts/netic-oaas
$ helm dependency update .
```

### Deploy the chart to the local kind cluster.

```bash
$ helm upgrade -i -n netic-oaas-system --create-namespace oaas .
```
### See that the cluster is running with the observability package
```bash
$ kubectl get all -A 
```

### Emulate recieving data 
To emulate receiving data, a docker-compose configuration exists. 
This can be started with e.g. 

```bash
$ docker-compose up local/docker-compose.yml .
```
and should then start receiving log and metric events.

If you experience problems look at the docker-compose processes e.g.
```bash
$ cd local
$ docker-compose ps -a
```
Clean up e.g.
```bash
$ docker-compose rm <....>
```
Try again e.g.
```bash
$ docker-compose up 
```
### Test charts
```bash
$ helm template .
```

### Run linting of the charts locally.
```bash
$ docker run --rm -it -v "$(pwd)/..:/charts" quay.io/helmpack/chart-testing /bin/sh -c "helm repo add grafana https://grafana.github.io/helm-charts;ct lint --all --validate-maintainers=false"
```

### Delete the created cluster (once you are done with that)
```bash
$ kind delete cluster --name=oaas
```

## Working with your own cluster
You can use the commands aboce for installing OaaS in another cluster.

### Create the desired namespace in the created local kind cluster
```bash
$ kubectl create ns netic-oaas-system
```

### Potentially initialize Helm (if this is first time running this).
```bash
$ helm repo add grafana https://grafana.github.io/helm-charts
```

### Potentially update Helm dependencies
```bash
$ cd charts/netic-oaas
$ helm dependency update .
```

### Deploy the chart to the local kind cluster.

```bash
$ helm upgrade -i -n netic-oaas-system --create-namespace oaas .
```
### See that the cluster is running with the observability package
```bash
$ kubectl get all -A 
```
