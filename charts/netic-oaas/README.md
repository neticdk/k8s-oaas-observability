# Netic Operation as a Service (OaaS)

The chart installs observability stack to monitor Kubernetes utility cluster.

## Working Locally

The chart can be tested locally using Kubernetes in Docker (kind) and Docker compose (simulating
Netic data collection). All the following commands assume current directory is the chart root.

First make sure external rules and dashboards are downloaded. As the external templates are based on
`jsonnet` this needs to be available.

```bash
# Assuming $GOPATH/bin is in path
$ go get github.com/google/go-jsonnet/cmd/jsonnet
$ go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb
$ ./ci/update-rules.sh
```

Starting up a kind cluster can be done based on the cluster definition `hack/kind-cluster.yaml`.

```bash
$ kind create cluster --name oaas --config hack/kind-cluster.yaml
```

Then initialize Helm (if this is first time running this).

```bash
$ helm repo add grafana https://grafana.github.io/helm-charts
$ helm dependency update .
```

Now it is possible to deploy the chart to the kind cluster.

```bash
$ helm upgrade -i -n netic-oaas-system --create-namespace oaas .
```

Test charts
```bash
$ helm template .
```


To simulate the components receiving data in Netic a `docker-compose` configuration exists. This
can be started and should then start receiving log and metric events.

```bash
$ cd hack
$ docker-compose up hack/docker-compose.yml
```

Run linting of the charts locally.

```bash
$ docker run --rm -it -v "$(pwd)/..:/charts" quay.io/helmpack/chart-testing /bin/sh -c "helm repo add grafana https://grafana.github.io/helm-charts;ct lint --all --validate-maintainers=false"
```
