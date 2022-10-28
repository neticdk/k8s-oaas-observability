# prometheus-node-exporter

# prometheus-node-exporter

![Version: 1.0.2](https://img.shields.io/badge/Version-1.0.2-informational?style=flat-square) ![AppVersion: 1.0.1](https://img.shields.io/badge/AppVersion-1.0.1-informational?style=flat-square)

A Helm chart for prometheus node-exporter

**Homepage:** <https://github.com/prometheus/node_exporter>

## TL;DR;

```bash
$ helm repo add netic-oaas https://neticdk.github.io/k8s-oaas-observability
$ helm install netic-oaas netic-oaas/prometheus-node-exporter
```

## Introduction

This chart bootstraps a prometheus [node exporter](https://github.com/prometheus/node_exporter) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm repo add netic-oaas https://neticdk.github.io/k8s-oaas-observability
$ helm install --name my-release netic-oaas/prometheus-node-exporter
```

The command deploys node exporter on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Source Code

* <https://github.com/prometheus/node_exporter>
* <https://github.com/neticdk/k8s-oaas-observability/tree/main/charts/prometheus-node-exporter>

## Configuration

The following table lists the configurable parameters of the Node Exporter chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | A group of affinity scheduling rules for pod assignment |
| configmaps | list | `[]` | Allow mounting additional configmaps. |
| endpoints | list | `[]` | list of addresses that have node exporter deployed outside of the cluster |
| extraArgs | list | `[]` | Additional container arguments |
| extraHostVolumeMounts | list | `[]` | Additional mounts from the host |
| hostNetwork | bool | `true` | Whether to expose the service to the host network |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"quay.io/prometheus/node-exporter","tag":"v1.0.1"}` |  This is a YAML-formatted file. Declare variables to be passed into your templates. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"quay.io/prometheus/node-exporter"` | Image repository |
| image.tag | string | `"v1.0.1"` | Image tag |
| namespaceOverride | string | `""` | Override the deployment namespace @default will be set to `.Release.Namespace` if not set |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| podAnnotations | object | `{}` | Annotations to be added to node exporter pods |
| podLabels | object | `{}` | Additional labels to be added to pods |
| priorityClassName | string | `nil` | Name of Priority Class to assign pods |
| prometheus.monitor.additionalLabels | object | `{}` | Additional labels that can be used so ServiceMonitor will be discovered by Prometheus |
| prometheus.monitor.enabled | bool | `false` | Set this to `true` to create ServiceMonitor for Prometheus operator |
| prometheus.monitor.namespace | string | `""` | namespace where servicemonitor resource should be created |
| prometheus.monitor.relabelings | list | `[]` | Relabelings that should be applied on the ServerMonitor |
| prometheus.monitor.scrapeTimeout | string | `"10s"` | Timeout after which the scrape is ended |
| rbac.create | bool | `true` | If true, create & use RBAC resources |
| rbac.pspEnabled | bool | `true` | Specifies whether a PodSecurityPolicy should be created. https://kubernetes.io/docs/concepts/policy/pod-security-policy/ |
| resources | object | `{}` | CPU/Memory resource requests/limits |
| securityContext | object | `{"fsGroup":65534,"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534}` | SecurityContext |
| service.annotations | object | `{"prometheus.io/scrape":"true"}` | Kubernetes service annotations |
| service.listenOnAllInterfaces | bool | `true` | If true, listen on all interfaces using IP `0.0.0.0`. Else listen on the IP address pod has been assigned by Kubernetes. |
| service.nodePort | string | `nil` | The node port of the service |
| service.port | int | `9100` | The service port |
| service.targetPort | int | `9100` | The target port of the container |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.create | bool | `true` | Specifies whether a ServiceAccount should be created |
| serviceAccount.imagePullSecrets | list | `[]` | Specify image pull secrets |
| serviceAccount.name | string | `nil` | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the fullname template |
| sidecarVolumeMount | list | `[]` | Volume for sidecar containers |
| sidecars | list | `[]` | Additional containers for export metrics to text file |
| tolerations | list | `[{"effect":"NoSchedule","operator":"Exists"}]` | List of node taints to tolerate |
| updateStrategy | object | `{"rollingUpdate":{"maxUnavailable":1},"type":"RollingUpdate"}` | Configure a custom update strategy for the daemonset |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install --name my-release \
  --set serviceAccount.name=node-exporter  \
    netic-oaas/prometheus-node-exporter
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml netic-oaas/prometheus-node-exporter
```
