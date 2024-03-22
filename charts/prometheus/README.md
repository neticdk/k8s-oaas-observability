# prometheus

# prometheus

![Version: 2.1.1](https://img.shields.io/badge/Version-2.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.50.1](https://img.shields.io/badge/AppVersion-v2.50.1-informational?style=flat-square)

A Helm chart to install Prometheus based on Prometheus Operator

**Homepage:** <https://prometheus.io/>

## TL;DR;

```bash
$ helm repo add netic-oaas http://neticdk.github.io/k8s-oaas-observability
$ helm install netic-oaas netic-oaas/prometheus
```

## Introduction

This chart creates new Prometheus instance based on the Prometheus Operator but adds creation of service
account, cluster role and cluster role binding which is not covered by the Prometheus Operator.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm repo add netic-oaas http://neticdk.github.io/k8s-oaas-observability
$ helm install --name my-release netic-oaas/prometheus
```

The command deploys node exporter on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Source Code

* <https://github.com/prometheus/prometheus>
* <https://github.com/neticdk/k8s-oaas-observability>

## Configuration

The following table lists the configurable parameters of the Node Exporter chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.imagePullSecrets | list | `[]` |  |
| global.networkPolicyEnabled | bool | `true` |  |
| ingress.enabled | bool | `false` |  |
| prometheusSpec.alerting | object | `{}` |  |
| prometheusSpec.externalLabels | object | `{}` |  |
| prometheusSpec.image | string | `"quay.io/prometheus/prometheus:v2.50.1"` |  |
| prometheusSpec.podMonitorNamespaceSelector | object | `{}` |  |
| prometheusSpec.podMonitorSelector | object | `{}` |  |
| prometheusSpec.priorityClassName | string | `"secure-cloud-stack-technical-operations-critical"` |  |
| prometheusSpec.probeNamespaceSelector | object | `{}` |  |
| prometheusSpec.probeSelector | object | `{}` |  |
| prometheusSpec.remoteWrite | list | `[]` |  |
| prometheusSpec.replicas | int | `2` |  |
| prometheusSpec.resources | object | `{}` |  |
| prometheusSpec.retention | string | `"10d"` |  |
| prometheusSpec.retentionSize | string | `""` |  |
| prometheusSpec.routePrefix | string | `"/"` |  |
| prometheusSpec.ruleNamespaceSelector | object | `{}` |  |
| prometheusSpec.ruleSelector | object | `{}` |  |
| prometheusSpec.secrets | list | `[]` |  |
| prometheusSpec.serviceMonitorNamespaceSelector | object | `{}` |  |
| prometheusSpec.serviceMonitorSelector | object | `{}` |  |
| prometheusSpec.storage | object | `{}` |  |
| prometheusSpec.version | string | `"v2.50.1"` |  |
| serviceAccount.create | bool | `true` |  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install --name my-release \
  --set serviceAccount.name=prometheus  \
    netic-oaas/prometheus
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml netic-oaas/prometheus
```
