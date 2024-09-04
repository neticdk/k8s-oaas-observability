# prometheus-operator

![Version: 2.0.2](https://img.shields.io/badge/Version-2.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.76.1](https://img.shields.io/badge/AppVersion-v0.76.1-informational?style=flat-square)

A Helm chart to install Prometheus Operator

**Homepage:** <https://github.com/prometheus-operator/prometheus-operator>

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add netic-oaas https://neticdk.github.io/k8s-oaas-observability
$ helm install my-release netic-oaas/prometheus-operator
```

## Source Code

* <https://github.com/prometheus-operator/prometheus-operator>
* <https://github.com/neticdk/k8s-oaas-observability/tree/main/charts/prometheus-operator>

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.rbac.create | bool | `true` |  |
| global.rbac.pspAnnotations | object | `{}` |  |
| global.rbac.pspEnabled | bool | `false` |  |
| global.serviceMonitor.labels | object | `{}` |  |
| prometheusOperator.affinity | object | `{}` | Assign custom affinity rules to the prometheus operator ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| prometheusOperator.configReloaderCpu | string | `"100m"` | Set the prometheus config reloader side-car CPU limit |
| prometheusOperator.configReloaderMemory | string | `"25Mi"` | Set the prometheus config reloader side-car memory limit |
| prometheusOperator.denyNamespaces | list | `[]` | Namespaces not to scope the interaction of the Prometheus Operator (deny list). |
| prometheusOperator.enabled | bool | `true` |  |
| prometheusOperator.hostNetwork | bool | `false` | Required for use in managed kubernetes clusters (such as AWS EKS) with custom CNI (such as calico), because control-plane managed by AWS cannot communicate with pods' IP CIDR and admission webhooks are not working |
| prometheusOperator.hyperkubeImage | object | `{"pullPolicy":"Always","repository":"registry.k8s.io/hyperkube","sha":"","tag":"v1.18.20"}` | Hyperkube image to use when cleaning up |
| prometheusOperator.image | object | `{"pullPolicy":"Always","repository":"quay.io/prometheus-operator/prometheus-operator","sha":"","tag":""}` | Prometheus-operator image |
| prometheusOperator.kubeletService | object | `{"enabled":true,"namespace":"kube-system"}` | If true, the operator will create and maintain a service for scraping kubelets ref: https://github.com/coreos/prometheus-operator/blob/master/helm/prometheus-operator/README.md |
| prometheusOperator.logFormat | string | `"logfmt"` | Define Log Format Use logfmt (default) or json-formatted logging |
| prometheusOperator.namespaces | object | `{}` | Namespaces to scope the interaction of the Prometheus Operator and the apiserver (allow list). This is mutually exclusive with denyNamespaces. Setting this to an empty object will disable the configuration |
| prometheusOperator.nodeSelector | object | `{}` | Define which Nodes the Pods are scheduled on. ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| prometheusOperator.podAnnotations | object | `{}` | Annotations to add to the operator pod |
| prometheusOperator.podLabels | object | `{}` | Labels to add to the operator pod |
| prometheusOperator.priorityClassName | string | `"secure-cloud-stack-technical-operations-critical"` | Assign a PriorityClassName to pods if set |
| prometheusOperator.prometheusConfigReloaderImage | object | `{"repository":"quay.io/prometheus-operator/prometheus-config-reloader","sha":"","tag":""}` | Prometheus-config-reloader image to use for config and rule reloading |
| prometheusOperator.resources | object | `{"limits":{"memory":"192Mi"},"requests":{"cpu":"150m","memory":"192Mi"}}` | Resource limits & requests |
| prometheusOperator.securityContext.fsGroup | int | `65534` |  |
| prometheusOperator.securityContext.runAsGroup | int | `65534` |  |
| prometheusOperator.securityContext.runAsNonRoot | bool | `true` |  |
| prometheusOperator.securityContext.runAsUser | int | `65534` |  |
| prometheusOperator.service | object | `{"additionalPorts":[],"annotations":{},"clusterIP":"","externalIPs":[],"labels":{},"loadBalancerIP":"","loadBalancerSourceRanges":[],"nodePort":30080,"nodePortTls":30443,"type":"ClusterIP"}` | Configuration for Prometheus operator service |
| prometheusOperator.service.additionalPorts | list | `[]` | Additional ports to open for Prometheus service ref: https://kubernetes.io/docs/concepts/services-networking/service/#multi-port-services |
| prometheusOperator.service.externalIPs | list | `[]` | List of IP addresses at which the Prometheus server service is available Ref: https://kubernetes.io/docs/user-guide/services/#external-ips |
| prometheusOperator.service.loadBalancerIP | string | `""` | Loadbalancer IP Only use if service.type is "loadbalancer" |
| prometheusOperator.service.nodePort | int | `30080` | Port to expose on each node Only used if service.type is 'NodePort' |
| prometheusOperator.service.type | string | `"ClusterIP"` | Service type NodePort, ClusterIP, loadbalancer |
| prometheusOperator.serviceAccount | object | `{"create":true,"name":""}` | Service account for Prometheus operator to use. ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/ |
| prometheusOperator.serviceMonitor | object | `{"interval":"","metricRelabelings":[],"relabelings":[],"scrapeTimeout":"","selfMonitor":true}` | Create a servicemonitor for the operator |
| prometheusOperator.serviceMonitor.interval | string | `""` | Scrape interval. If not set, the Prometheus default scrape interval is used. |
| prometheusOperator.serviceMonitor.metricRelabelings | list | `[]` | metric relabel configs to apply to samples before ingestion. |
| prometheusOperator.serviceMonitor.relabelings | list | `[]` | relabel configs to apply to samples before ingestion. |
| prometheusOperator.serviceMonitor.scrapeTimeout | string | `""` | Scrape timeout. If not set, the Prometheus default scrape timeout is used. |
| prometheusOperator.tolerations | list | `[]` | Tolerations for use with node taints ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
