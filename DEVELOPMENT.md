# Development

The source code for the Netic OaaS Observability stack consists of a number of [Helm](https://helm.sh) charts and a [Kubernetes controller](https://kubernetes.io/docs/concepts/architecture/controller/) used as an add-on in certain scenarios.

Working on the code requires a certain tool set to be installed on the workstation.

## Prerequisites

Working on the controllers requires the [Bazel](https://bazel.build) build tool to be installed. This is available in a number of different package formats for MacOS is can be installed from [Brew](https://brew.sh).

```bash
$ brew install bazel
```

The [README.md](controllers/endpoint-controller/README.md) within the `endpoint-controller` describes the conrete supported targets. As the controllers are written in [Go](https://golang.org) it is also recommended to install Go.

Working with the Helm charts and being able to test these locally requires a number of tools to be available.

| Tool      | Purpose                                                              |
| ---       | ---                                                                  |
| `docker`  | Container engine for running Kubernetes                              |
| `helm`    | Used for rendering, deplpoying, and more of the Helm templates       |
| `kubectl` | CLI used to interact with Kubernetes clusters                        |
| `kind`    | Used for running local Kubernetes clusters for testing               |
| `go`      | Used to fetch (compile and install) different Go based tools easily  |

On MacOS most of these tools may be installed from Brew as below.

```bash
brew install --cask docker
brew install helm
brew install kubectl
brew install kind
brew install go
```

Make sure the Go bin path is in the path - on Bourne shell based shells this could be done as.

```bash
export PATH=$PATH:$(go env GOPATH)/bin
```

Install Go based utilities

```bash
go install github.com/google/go-jsonnet/cmd/jsonnet@latest # On MacOS this may be installed from Brew instead
go install github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest
GO111MODULE=on go install github.com/norwoodj/helm-docs/cmd/helm-docs@latest
```

## Working with the Charts

A number of files in the charts are generated when the charts are released. Working locally it is necessary to first generate these files the same way the CI system would have.

The recording and alerting rules as well as Grafana dashboards used by the `netic-oaas` chart are rendered based on jsonnet mixins. Rendering these is done running the `update-rules.sh` script.

```bash
$ ./charts/netic-oaas/scripts/update-rules.sh
```

Rendering the `README.md` files of the charts are done simply running `helm-docs` in the root of the project. This will update all `README.md` files.

```bash
$ helm-docs
```

Some of the charts has external dependencies which needs to be fetched before the chart may be deployed.

```bash
$ helm repo add grafana https://grafana.github.io/helm-charts
$ helm repo add neticdkvector https://neticdk.github.io/vector
$ helm dependency build charts/netic-oaas
```

If the dependencies change it will be necessary to run `helm dependency update charts/netic-oaas`.

It is possible to render all manifests of a chart inspecting the result by running the `helm template` command.

```bash
$ helm template charts/netic-oaas
```

The CI will run a number of validations on the chart source. This can be done locally using docker.

```bash
$ docker run -it --rm -v $(pwd):/src quay.io/helmpack/chart-testing:v3.3.1 sh -c "cd src; ct lint --all --chart-repos grafana=https://grafana.github.io/helm-charts --chart-repos neticdkvector=https://neticdk.github.io/vector"
```

### Deploying Locally

The charts can be deployed locally in a [kind](https://kind.sigs.k8s.io/) based cluster. The `netic-oaas` provides a configuration for starting up a suitable cluster as below.

```bash
$ kind create cluster --name oaas --config charts/netic-oaas/local/kind-cluster.yaml
```

Afterwards you should be able to verify the cluster up and running using `kubectl`.

```bash
$ kubectl cluster-info --context kind-oaas
```

Now it is possible to use `helm` to deploy a chart on the local cluster (_note_ by default `helm` will used the current active context from the kube config).

```bash
$ helm upgrade -i --create-namespace -n netic-oaas-system netic-oaas
```

It is possible to list resources created by the deployment using `kubectl`.

```bash
$ kubectl -n netic-oaas-system get all
```

Cleaning up, deleting the cluster.

```bash
$ kind delete cluster --name=oaas
```

### Emulate Central Collector Locally

To emulate receiving data, a `docker-compose` configuration exists.
This can be started with e.g.

```bash
$ docker-compose up charts/netic-oaas/local/docker-compose.yml .
```
and should then start receiving log and metric events.

If you experience problems look at the docker-compose processes e.g.
```bash
$ cd charts/netic-oaas/local
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
