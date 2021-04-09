# oaas-observability

![Version: 1.1.7](https://img.shields.io/badge/Version-1.1.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart to deploy obeservability stack on Kubernetes

**Homepage:** <https://github.com/neticdk/k8s-oaas-observability>

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add netic-oaas http://neticdk.github.io/k8s-oaas-observability
$ helm install my-release netic-oaas/oaas-observability
```

## Source Code

* <https://github.com/neticdk/k8s-oaas-observability>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../kube-state-metrics | kube-state-metrics | * |
| file://../prometheus-node-exporter | prometheus-node-exporter | * |
| file://../prometheus-operator | prometheus-operator | * |
| https://grafana.github.io/helm-charts | grafana | 6.7.3 |
| https://packages.timber.io/helm/latest | vector-agent | 0.12.2 |

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alertmanager.alertmanagerSpec.additionalPeers | list | `[]` |  |
| alertmanager.alertmanagerSpec.affinity | object | `{}` |  |
| alertmanager.alertmanagerSpec.configMaps | list | `[]` |  |
| alertmanager.alertmanagerSpec.containers | list | `[]` |  |
| alertmanager.alertmanagerSpec.externalUrl | string | `nil` |  |
| alertmanager.alertmanagerSpec.image.repository | string | `"quay.io/prometheus/alertmanager"` |  |
| alertmanager.alertmanagerSpec.image.tag | string | `"v0.21.0"` |  |
| alertmanager.alertmanagerSpec.listenLocal | bool | `false` |  |
| alertmanager.alertmanagerSpec.logFormat | string | `"logfmt"` |  |
| alertmanager.alertmanagerSpec.logLevel | string | `"info"` |  |
| alertmanager.alertmanagerSpec.nodeSelector | object | `{}` |  |
| alertmanager.alertmanagerSpec.paused | bool | `false` |  |
| alertmanager.alertmanagerSpec.podAntiAffinity | string | `""` |  |
| alertmanager.alertmanagerSpec.podAntiAffinityTopologyKey | string | `"kubernetes.io/hostname"` |  |
| alertmanager.alertmanagerSpec.portName | string | `"web"` |  |
| alertmanager.alertmanagerSpec.priorityClassName | string | `""` |  |
| alertmanager.alertmanagerSpec.replicas | int | `1` |  |
| alertmanager.alertmanagerSpec.resources | object | `{}` |  |
| alertmanager.alertmanagerSpec.retention | string | `"120h"` |  |
| alertmanager.alertmanagerSpec.routePrefix | string | `"/"` |  |
| alertmanager.alertmanagerSpec.secrets | list | `[]` |  |
| alertmanager.alertmanagerSpec.securityContext.fsGroup | int | `2000` |  |
| alertmanager.alertmanagerSpec.securityContext.runAsGroup | int | `2000` |  |
| alertmanager.alertmanagerSpec.securityContext.runAsNonRoot | bool | `true` |  |
| alertmanager.alertmanagerSpec.securityContext.runAsUser | int | `1000` |  |
| alertmanager.alertmanagerSpec.storage | object | `{}` |  |
| alertmanager.alertmanagerSpec.tolerations | list | `[]` |  |
| alertmanager.alertmanagerSpec.useExistingSecret | bool | `false` |  |
| alertmanager.alertmanagerSpec.version | string | `"v0.21.0"` |  |
| alertmanager.apiVersion | string | `"v2"` |  |
| alertmanager.config.global.resolve_timeout | string | `"5m"` |  |
| alertmanager.config.receivers[0].name | string | `"null"` |  |
| alertmanager.config.route.group_by[0] | string | `"job"` |  |
| alertmanager.config.route.group_interval | string | `"5m"` |  |
| alertmanager.config.route.group_wait | string | `"30s"` |  |
| alertmanager.config.route.receiver | string | `"null"` |  |
| alertmanager.config.route.repeat_interval | string | `"12h"` |  |
| alertmanager.config.route.routes[0].match.alertname | string | `"Watchdog"` |  |
| alertmanager.config.route.routes[0].receiver | string | `"null"` |  |
| alertmanager.enabled | bool | `true` |  |
| alertmanager.ingress.annotations | object | `{}` |  |
| alertmanager.ingress.enabled | bool | `false` |  |
| alertmanager.ingress.hosts | list | `[]` |  |
| alertmanager.ingress.labels | object | `{}` |  |
| alertmanager.ingress.paths | list | `[]` |  |
| alertmanager.ingress.tls | list | `[]` |  |
| alertmanager.ingressPerReplica.annotations | object | `{}` |  |
| alertmanager.ingressPerReplica.enabled | bool | `false` |  |
| alertmanager.ingressPerReplica.hostDomain | string | `""` |  |
| alertmanager.ingressPerReplica.hostPrefix | string | `""` |  |
| alertmanager.ingressPerReplica.labels | object | `{}` |  |
| alertmanager.ingressPerReplica.paths | list | `[]` |  |
| alertmanager.ingressPerReplica.tlsSecretName | string | `""` |  |
| alertmanager.ingressPerReplica.tlsSecretPerReplica.enabled | bool | `false` |  |
| alertmanager.ingressPerReplica.tlsSecretPerReplica.prefix | string | `"alertmanager"` |  |
| alertmanager.podDisruptionBudget.enabled | bool | `false` |  |
| alertmanager.podDisruptionBudget.maxUnavailable | string | `""` |  |
| alertmanager.podDisruptionBudget.minAvailable | int | `1` |  |
| alertmanager.secret.annotations | object | `{}` |  |
| alertmanager.service.annotations | object | `{}` |  |
| alertmanager.service.clusterIP | string | `""` |  |
| alertmanager.service.externalIPs | list | `[]` |  |
| alertmanager.service.labels | object | `{}` |  |
| alertmanager.service.loadBalancerIP | string | `""` |  |
| alertmanager.service.loadBalancerSourceRanges | list | `[]` |  |
| alertmanager.service.nodePort | int | `30903` |  |
| alertmanager.service.port | int | `9093` |  |
| alertmanager.service.targetPort | int | `9093` |  |
| alertmanager.service.type | string | `"ClusterIP"` |  |
| alertmanager.serviceAccount.annotations | object | `{}` |  |
| alertmanager.serviceAccount.create | bool | `true` |  |
| alertmanager.serviceAccount.name | string | `""` |  |
| alertmanager.serviceMonitor.interval | string | `""` |  |
| alertmanager.serviceMonitor.metricRelabelings | list | `[]` |  |
| alertmanager.serviceMonitor.relabelings | list | `[]` |  |
| alertmanager.serviceMonitor.selfMonitor | bool | `true` |  |
| alertmanager.servicePerReplica.annotations | object | `{}` |  |
| alertmanager.servicePerReplica.enabled | bool | `false` |  |
| alertmanager.servicePerReplica.loadBalancerSourceRanges | list | `[]` |  |
| alertmanager.servicePerReplica.nodePort | int | `30904` |  |
| alertmanager.servicePerReplica.port | int | `9093` |  |
| alertmanager.servicePerReplica.targetPort | int | `9093` |  |
| alertmanager.servicePerReplica.type | string | `"ClusterIP"` |  |
| alertmanager.templateFiles | object | `{}` |  |
| alertmanager.tplConfig | bool | `false` |  |
| coreDns.enabled | bool | `false` |  |
| coreDns.service.port | int | `9153` |  |
| coreDns.service.targetPort | int | `9153` |  |
| coreDns.serviceMonitor.interval | string | `""` |  |
| coreDns.serviceMonitor.metricRelabelings | list | `[]` |  |
| coreDns.serviceMonitor.relabelings | list | `[]` |  |
| endpointController.enabled | bool | `false` |  |
| endpointController.image.pullPolicy | string | `"IfNotPresent"` |  |
| endpointController.image.repository | string | `"registry.netic.dk/endpoint-controller"` |  |
| endpointController.image.tag | string | `"latest"` |  |
| endpointController.resources | object | `{}` |  |
| global.networkPolicyEnabled | bool | `true` |  |
| global.rbac.create | bool | `true` |  |
| global.rbac.pspAnnotations | object | `{}` |  |
| global.rbac.pspEnabled | bool | `true` |  |
| global.serviceMonitor.labels."netic.dk/monitoring" | string | `"true"` |  |
| grafana.enabled | bool | `true` |  |
| grafana.sidecar.dashboards.enabled | bool | `true` |  |
| grafana.sidecar.dashboards.label | string | `"netic_grafana_dashboard"` |  |
| grafana.sidecar.datasources.enabled | bool | `true` |  |
| grafana.sidecar.datasources.label | string | `"netic_grafana_datasource"` |  |
| grafana.testFramework.enabled | bool | `false` |  |
| kube-state-metrics.podSecurityPolicy.enabled | bool | `true` |  |
| kube-state-metrics.prometheus.monitor.enabled | bool | `true` |  |
| kube-state-metrics.prometheus.monitor.honorLabels | bool | `true` |  |
| kubeApiServer.enabled | bool | `true` |  |
| kubeApiServer.relabelings[0].action | string | `"replace"` |  |
| kubeApiServer.relabelings[0].replacement | string | `"kube-apiserver"` |  |
| kubeApiServer.relabelings[0].sourceLabels[0] | string | `"job"` |  |
| kubeApiServer.relabelings[0].targetLabel | string | `"job"` |  |
| kubeApiServer.serviceMonitor.interval | string | `""` |  |
| kubeApiServer.serviceMonitor.jobLabel | string | `"component"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings | list | `[]` |  |
| kubeApiServer.serviceMonitor.selector.matchLabels.component | string | `"apiserver"` |  |
| kubeApiServer.serviceMonitor.selector.matchLabels.provider | string | `"kubernetes"` |  |
| kubeApiServer.tlsConfig.insecureSkipVerify | bool | `false` |  |
| kubeApiServer.tlsConfig.serverName | string | `"kubernetes"` |  |
| kubeControllerManager.enabled | bool | `true` |  |
| kubeControllerManager.endpoints | list | `[]` |  |
| kubeControllerManager.service.port | int | `10257` |  |
| kubeControllerManager.service.targetPort | int | `10257` |  |
| kubeControllerManager.serviceMonitor.https | bool | `true` |  |
| kubeControllerManager.serviceMonitor.insecureSkipVerify | bool | `true` |  |
| kubeControllerManager.serviceMonitor.interval | string | `""` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings | list | `[]` |  |
| kubeControllerManager.serviceMonitor.relabelings | list | `[]` |  |
| kubeControllerManager.serviceMonitor.serverName | string | `"127.0.0.1"` |  |
| kubeDns.enabled | bool | `false` |  |
| kubeDns.service.dnsmasq.port | int | `10054` |  |
| kubeDns.service.dnsmasq.targetPort | int | `10054` |  |
| kubeDns.service.skydns.port | int | `10055` |  |
| kubeDns.service.skydns.targetPort | int | `10055` |  |
| kubeDns.serviceMonitor.dnsmasqMetricRelabelings | list | `[]` |  |
| kubeDns.serviceMonitor.dnsmasqRelabelings | list | `[]` |  |
| kubeDns.serviceMonitor.interval | string | `""` |  |
| kubeDns.serviceMonitor.metricRelabelings | list | `[]` |  |
| kubeDns.serviceMonitor.relabelings | list | `[]` |  |
| kubeEtcd.enabled | bool | `true` |  |
| kubeEtcd.endpoints | list | `[]` |  |
| kubeEtcd.service.port | int | `2381` |  |
| kubeEtcd.service.targetPort | int | `2381` |  |
| kubeEtcd.serviceMonitor.caFile | string | `""` |  |
| kubeEtcd.serviceMonitor.certFile | string | `""` |  |
| kubeEtcd.serviceMonitor.insecureSkipVerify | bool | `false` |  |
| kubeEtcd.serviceMonitor.interval | string | `""` |  |
| kubeEtcd.serviceMonitor.keyFile | string | `""` |  |
| kubeEtcd.serviceMonitor.metricRelabelings | list | `[]` |  |
| kubeEtcd.serviceMonitor.relabelings | list | `[]` |  |
| kubeEtcd.serviceMonitor.scheme | string | `"http"` |  |
| kubeEtcd.serviceMonitor.serverName | string | `""` |  |
| kubeProxy.enabled | bool | `false` |  |
| kubeProxy.endpoints | list | `[]` |  |
| kubeProxy.service.port | int | `10249` |  |
| kubeProxy.service.targetPort | int | `10249` |  |
| kubeProxy.serviceMonitor.https | bool | `false` |  |
| kubeProxy.serviceMonitor.interval | string | `""` |  |
| kubeProxy.serviceMonitor.metricRelabelings | list | `[]` |  |
| kubeProxy.serviceMonitor.relabelings | list | `[]` |  |
| kubeScheduler.enabled | bool | `true` |  |
| kubeScheduler.endpoints | list | `[]` |  |
| kubeScheduler.service.port | int | `10259` |  |
| kubeScheduler.service.targetPort | int | `10259` |  |
| kubeScheduler.serviceMonitor.https | bool | `true` |  |
| kubeScheduler.serviceMonitor.insecureSkipVerify | bool | `true` |  |
| kubeScheduler.serviceMonitor.interval | string | `""` |  |
| kubeScheduler.serviceMonitor.metricRelabelings | list | `[]` |  |
| kubeScheduler.serviceMonitor.relabelings | list | `[]` |  |
| kubeScheduler.serviceMonitor.serverName | string | `"127.0.0.1"` |  |
| kubelet.enabled | bool | `true` |  |
| kubelet.namespace | string | `"kube-system"` |  |
| kubelet.serviceMonitor.cAdvisor | bool | `true` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings | list | `[]` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[0].sourceLabels[0] | string | `"__metrics_path__"` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[0].targetLabel | string | `"metrics_path"` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[1].action | string | `"replace"` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[1].replacement | string | `"cadvisor"` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[1].sourceLabels[0] | string | `"job"` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[1].targetLabel | string | `"job"` |  |
| kubelet.serviceMonitor.https | bool | `true` |  |
| kubelet.serviceMonitor.interval | string | `""` |  |
| kubelet.serviceMonitor.metricRelabelings | list | `[]` |  |
| kubelet.serviceMonitor.probes | bool | `true` |  |
| kubelet.serviceMonitor.probesMetricRelabelings | list | `[]` |  |
| kubelet.serviceMonitor.probesRelabelings[0].sourceLabels[0] | string | `"__metrics_path__"` |  |
| kubelet.serviceMonitor.probesRelabelings[0].targetLabel | string | `"metrics_path"` |  |
| kubelet.serviceMonitor.relabelings[0].sourceLabels[0] | string | `"__metrics_path__"` |  |
| kubelet.serviceMonitor.relabelings[0].targetLabel | string | `"metrics_path"` |  |
| kubelet.serviceMonitor.resource | bool | `true` |  |
| kubelet.serviceMonitor.resourcePath | string | `"/metrics/resource/v1alpha1"` |  |
| kubelet.serviceMonitor.resourceRelabelings[0].sourceLabels[0] | string | `"__metrics_path__"` |  |
| kubelet.serviceMonitor.resourceRelabelings[0].targetLabel | string | `"metrics_path"` |  |
| nodeExporter.enabled | bool | `true` |  |
| nodeExporter.jobLabel | string | `"app.kubernetes.io/name"` |  |
| nodeExporter.serviceMonitor.interval | string | `""` |  |
| nodeExporter.serviceMonitor.metricRelabelings | list | `[]` |  |
| nodeExporter.serviceMonitor.relabelings[0].action | string | `"replace"` |  |
| nodeExporter.serviceMonitor.relabelings[0].replacement | string | `"node-exporter"` |  |
| nodeExporter.serviceMonitor.relabelings[0].sourceLabels[0] | string | `"job"` |  |
| nodeExporter.serviceMonitor.relabelings[0].targetLabel | string | `"job"` |  |
| nodeExporter.serviceMonitor.scrapeTimeout | string | `""` |  |
| prometheus-operator.enabled | bool | `true` |  |
| prometheus.annotations | object | `{}` |  |
| prometheus.ingress.annotations | object | `{}` |  |
| prometheus.ingress.enabled | bool | `false` |  |
| prometheus.ingress.hosts | list | `[]` |  |
| prometheus.ingress.labels | object | `{}` |  |
| prometheus.ingress.paths | list | `[]` |  |
| prometheus.ingress.tls | list | `[]` |  |
| prometheus.podDisruptionBudget.enabled | bool | `false` |  |
| prometheus.podDisruptionBudget.maxUnavailable | string | `""` |  |
| prometheus.podDisruptionBudget.minAvailable | int | `1` |  |
| prometheus.podSecurityPolicy.allowedCapabilities | list | `[]` |  |
| prometheus.prometheusSpec.affinity | object | `{}` |  |
| prometheus.prometheusSpec.alertingEndpoints | list | `[]` |  |
| prometheus.prometheusSpec.apiserverConfig | object | `{}` |  |
| prometheus.prometheusSpec.configMaps | list | `[]` |  |
| prometheus.prometheusSpec.containers | list | `[]` |  |
| prometheus.prometheusSpec.disableCompaction | bool | `false` |  |
| prometheus.prometheusSpec.enableAdminAPI | bool | `false` |  |
| prometheus.prometheusSpec.evaluationInterval | string | `""` |  |
| prometheus.prometheusSpec.externalLabels.cluster | string | `"dummy"` |  |
| prometheus.prometheusSpec.externalUrl | string | `""` |  |
| prometheus.prometheusSpec.image.repository | string | `"quay.io/prometheus/prometheus"` |  |
| prometheus.prometheusSpec.image.tag | string | `"v2.21.0"` |  |
| prometheus.prometheusSpec.initContainers | list | `[]` |  |
| prometheus.prometheusSpec.listenLocal | bool | `false` |  |
| prometheus.prometheusSpec.logFormat | string | `"logfmt"` |  |
| prometheus.prometheusSpec.logLevel | string | `"info"` |  |
| prometheus.prometheusSpec.nodeSelector | object | `{}` |  |
| prometheus.prometheusSpec.paused | bool | `false` |  |
| prometheus.prometheusSpec.podAntiAffinity | string | `""` |  |
| prometheus.prometheusSpec.podAntiAffinityTopologyKey | string | `"kubernetes.io/hostname"` |  |
| prometheus.prometheusSpec.podMonitorNamespaceSelector | object | `{}` |  |
| prometheus.prometheusSpec.podMonitorSelector | object | `{}` |  |
| prometheus.prometheusSpec.podMonitorSelectorNilUsesHelmValues | bool | `true` |  |
| prometheus.prometheusSpec.portName | string | `"web"` |  |
| prometheus.prometheusSpec.priorityClassName | string | `""` |  |
| prometheus.prometheusSpec.prometheusExternalLabelName | string | `""` |  |
| prometheus.prometheusSpec.prometheusExternalLabelNameClear | bool | `false` |  |
| prometheus.prometheusSpec.query | object | `{}` |  |
| prometheus.prometheusSpec.remoteRead | list | `[]` |  |
| prometheus.prometheusSpec.remoteWrite | list | `[]` |  |
| prometheus.prometheusSpec.remoteWriteDashboards | bool | `false` |  |
| prometheus.prometheusSpec.replicaExternalLabelName | string | `""` |  |
| prometheus.prometheusSpec.replicaExternalLabelNameClear | bool | `false` |  |
| prometheus.prometheusSpec.replicas | int | `1` |  |
| prometheus.prometheusSpec.resources | object | `{}` |  |
| prometheus.prometheusSpec.retention | string | `"10d"` |  |
| prometheus.prometheusSpec.retentionSize | string | `""` |  |
| prometheus.prometheusSpec.routePrefix | string | `"/"` |  |
| prometheus.prometheusSpec.ruleNamespaceSelector | object | `{}` |  |
| prometheus.prometheusSpec.ruleSelector | object | `{}` |  |
| prometheus.prometheusSpec.ruleSelectorNilUsesHelmValues | bool | `true` |  |
| prometheus.prometheusSpec.scrapeInterval | string | `""` |  |
| prometheus.prometheusSpec.secrets | list | `[]` |  |
| prometheus.prometheusSpec.securityContext.fsGroup | int | `2000` |  |
| prometheus.prometheusSpec.securityContext.runAsGroup | int | `2000` |  |
| prometheus.prometheusSpec.securityContext.runAsNonRoot | bool | `true` |  |
| prometheus.prometheusSpec.securityContext.runAsUser | int | `1000` |  |
| prometheus.prometheusSpec.serviceMonitorNamespaceSelector | object | `{}` |  |
| prometheus.prometheusSpec.serviceMonitorSelector.matchLabels."netic.dk/monitoring" | string | `"true"` |  |
| prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues | bool | `true` |  |
| prometheus.prometheusSpec.storageSpec | object | `{}` |  |
| prometheus.prometheusSpec.thanos | object | `{}` |  |
| prometheus.prometheusSpec.tolerations | list | `[]` |  |
| prometheus.prometheusSpec.version | string | `"v2.21.0"` |  |
| prometheus.prometheusSpec.volumeMounts | list | `[]` |  |
| prometheus.prometheusSpec.volumes | list | `[]` |  |
| prometheus.prometheusSpec.walCompression | bool | `false` |  |
| prometheus.service.annotations | object | `{}` |  |
| prometheus.service.clusterIP | string | `""` |  |
| prometheus.service.externalIPs | list | `[]` |  |
| prometheus.service.labels | object | `{}` |  |
| prometheus.service.loadBalancerIP | string | `""` |  |
| prometheus.service.loadBalancerSourceRanges | list | `[]` |  |
| prometheus.service.nodePort | int | `30090` |  |
| prometheus.service.port | int | `9090` |  |
| prometheus.service.sessionAffinity | string | `""` |  |
| prometheus.service.targetPort | int | `9090` |  |
| prometheus.service.type | string | `"ClusterIP"` |  |
| prometheus.serviceAccount.create | bool | `true` |  |
| prometheus.serviceAccount.name | string | `""` |  |
| prometheus.serviceMonitor.bearerTokenFile | string | `nil` |  |
| prometheus.serviceMonitor.interval | string | `""` |  |
| prometheus.serviceMonitor.metricRelabelings | list | `[]` |  |
| prometheus.serviceMonitor.relabelings | list | `[]` |  |
| prometheus.serviceMonitor.scheme | string | `""` |  |
| prometheus.serviceMonitor.selfMonitor | bool | `true` |  |
| prometheus.serviceMonitor.tlsConfig | object | `{}` |  |
| vector-agent.hostMetricsSource.enabled | bool | `false` |  |
| vector-agent.kubernetesLogsSource.rawConfig | string | `"annotation_fields.container_image = \"image\"\nannotation_fields.container_name = \"container\"\nannotation_fields.pod_labels = \"labels\"\nannotation_fields.pod_name = \"pod\"\nannotation_fields.pod_namespace = \"namespace\"\nannotation_fields.pod_node_name = \"node\"\nannotation_fields.pod_uid = \"name\"\n"` |  |
| vector-agent.prometheusSink.enabled | bool | `false` |  |
| vector-agent.psp.enabled | bool | `true` |  |
| vector-agent.rbac.enabled | bool | `true` |  |
| vector-agent.vectorSink.enabled | bool | `false` |  |

## Development

See [DEVELOPMENT.md](../../DEVELOPMENT.md)
