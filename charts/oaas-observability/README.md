# oaas-observability

![Version: 2.0.15](https://img.shields.io/badge/Version-2.0.15-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart to deploy obeservability stack on Kubernetes

**Homepage:** <https://github.com/neticdk/k8s-oaas-observability>

## A note on cert-manager

oaas-observability depends on cert-manager version 1.3.x. A cert-manager chart
is included but not enabled by default. It can be enabled by setting the value
`cert-manager.enabled` to `true`. Otherwise it is assumed that cert-manager has
been installed.

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
| file://../otel-operator | otel-operator | * |
| file://../prometheus-node-exporter | prometheus-node-exporter | * |
| file://../prometheus-operator | prometheus-operator | * |
| https://grafana.github.io/helm-charts | grafana | 6.9.2 |
| https://grafana.github.io/helm-charts | promtail | 3.5.1 |
| https://packages.timber.io/helm/latest | vector-agent | 0.17.0 |

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alertmanager.alertmanagerSpec.additionalPeers | list | `[]` |  |
| alertmanager.alertmanagerSpec.affinity | object | `{}` |  |
| alertmanager.alertmanagerSpec.alertmanagerConfigNamespaceSelector | object | `{}` | Namespaces to be selected for AlertmanagerConfig discovery. If nil, only check own namespace. |
| alertmanager.alertmanagerSpec.alertmanagerConfigSelector | object | `{"matchLabels":{"netic.dk/monitoring":"true"}}` | AlertmanagerConfigs to be selected for to merge and configure Alertmanager with. |
| alertmanager.alertmanagerSpec.configMaps | list | `[]` | ConfigMaps is a list of ConfigMaps in the same namespace as the Alertmanager object, which shall be mounted into the Alertmanager Pods. The ConfigMaps are mounted into /etc/alertmanager/configmaps/. |
| alertmanager.alertmanagerSpec.containers | list | `[]` |  |
| alertmanager.alertmanagerSpec.externalUrl | string | `nil` |  |
| alertmanager.alertmanagerSpec.image.repository | string | `"quay.io/prometheus/alertmanager"` |  |
| alertmanager.alertmanagerSpec.image.tag | string | `"v0.23.0"` |  |
| alertmanager.alertmanagerSpec.listenLocal | bool | `false` |  |
| alertmanager.alertmanagerSpec.logFormat | string | `"logfmt"` |  |
| alertmanager.alertmanagerSpec.logLevel | string | `"info"` | Log level for Alertmanager to be configured with. |
| alertmanager.alertmanagerSpec.nodeSelector | object | `{}` |  |
| alertmanager.alertmanagerSpec.paused | bool | `false` |  |
| alertmanager.alertmanagerSpec.podAntiAffinity | string | `""` |  |
| alertmanager.alertmanagerSpec.podAntiAffinityTopologyKey | string | `"kubernetes.io/hostname"` |  |
| alertmanager.alertmanagerSpec.portName | string | `"web"` |  |
| alertmanager.alertmanagerSpec.priorityClassName | string | `""` |  |
| alertmanager.alertmanagerSpec.replicas | int | `1` | Size is the expected size of the alertmanager cluster. The controller will eventually make the size of the running cluster equal to the expected size. |
| alertmanager.alertmanagerSpec.resources | object | `{}` |  |
| alertmanager.alertmanagerSpec.retention | string | `"120h"` | Time duration Alertmanager shall retain data for. Default is '120h', and must match the regular expression [0-9]+(ms|s|m|h) (milliseconds seconds minutes hours). |
| alertmanager.alertmanagerSpec.routePrefix | string | `"/"` |  |
| alertmanager.alertmanagerSpec.secrets | list | `[]` | Secrets is a list of Secrets in the same namespace as the Alertmanager object, which shall be mounted into the Alertmanager Pods. The Secrets are mounted into /etc/alertmanager/secrets/. |
| alertmanager.alertmanagerSpec.securityContext.fsGroup | int | `2000` |  |
| alertmanager.alertmanagerSpec.securityContext.runAsGroup | int | `2000` |  |
| alertmanager.alertmanagerSpec.securityContext.runAsNonRoot | bool | `true` |  |
| alertmanager.alertmanagerSpec.securityContext.runAsUser | int | `1000` |  |
| alertmanager.alertmanagerSpec.storage | object | `{}` | Storage is the definition of how storage will be used by the Alertmanager instances. ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/user-guides/storage.md |
| alertmanager.alertmanagerSpec.tolerations | list | `[]` |  |
| alertmanager.alertmanagerSpec.useExistingSecret | bool | `false` | If true then the user will be responsible to provide a secret with alertmanager configuration So when true the config part will be ignored (including templateFiles) and the one in the secret will be used |
| alertmanager.alertmanagerSpec.version | string | `"v0.23.0"` |  |
| alertmanager.apiVersion | string | `"v2"` | Api that prometheus will use to communicate with alertmanager. Possible values are v1, v2 |
| alertmanager.config | object | `{"global":{"resolve_timeout":"5m"},"receivers":[{"name":"null"}],"route":{"group_by":["job"],"group_interval":"5m","group_wait":"30s","receiver":"null","repeat_interval":"12h","routes":[{"match":{"alertname":"Watchdog"},"receiver":"null"}]}}` | Alertmanager configuration directives |
| alertmanager.enabled | bool | `true` | Deploy alertmanager |
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
| alertmanager.podDisruptionBudget | object | `{"enabled":false,"maxUnavailable":"","minAvailable":1}` | Configure pod disruption budgets for Alertmanager |
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
| alertmanager.serviceAccount | object | `{"annotations":{},"create":true,"name":""}` | Service account for Alertmanager to use. |
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
| alerts.enabled | bool | `true` | Should alerting rules be enabled |
| coreDns.enabled | bool | `false` | Should coreDns be scraped |
| coreDns.service.port | int | `9153` |  |
| coreDns.service.targetPort | int | `9153` |  |
| coreDns.serviceMonitor.interval | string | `""` |  |
| coreDns.serviceMonitor.metricRelabelings | list | `[]` |  |
| coreDns.serviceMonitor.relabelings | list | `[]` |  |
| endpointController.enabled | bool | `false` | Enable endpoint controller to expose external endpoints |
| endpointController.etcdService | bool | `true` | Expose etcd on nodes based on labels |
| endpointController.image.pullPolicy | string | `"IfNotPresent"` |  |
| endpointController.image.repository | string | `"ghcr.io/neticdk/endpoint-controller"` |  |
| endpointController.image.tag | string | `"v1.0.4"` |  |
| endpointController.kubeServices | bool | `true` | Expose controller and scheduler based on node labels |
| endpointController.nodeSelector | string | `nil` |  |
| endpointController.resources | object | `{}` |  |
| endpointController.windowsExporterService | bool | `false` | Expose windows hosts based on labels |
| global.networkPolicyEnabled | bool | `true` |  |
| global.rbac.create | bool | `true` |  |
| global.rbac.pspAnnotations | object | `{}` |  |
| global.rbac.pspEnabled | bool | `true` |  |
| global.serviceMonitor.labels | object | `{"netic.dk/monitoring":"true"}` | Labels to add to all service monitors |
| grafana.enabled | bool | `true` |  |
| grafana.sidecar.dashboards.enabled | bool | `true` |  |
| grafana.sidecar.dashboards.label | string | `"netic_grafana_dashboard"` |  |
| grafana.sidecar.datasources.enabled | bool | `true` |  |
| grafana.sidecar.datasources.label | string | `"netic_grafana_datasource"` |  |
| grafana.testFramework.enabled | bool | `false` |  |
| kube-state-metrics | object | `{"podSecurityPolicy":{"enabled":true},"prometheus":{"monitor":{"enabled":true,"honorLabels":true}}}` | Values for included kube-state-metrics chart |
| kubeApiServer.enabled | bool | `true` | Should api server be scraped |
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
| kubeControllerManager.service.port | int | `10252` |  |
| kubeControllerManager.service.targetPort | int | `10252` |  |
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
| kubeEtcd.endpoints | list | `[]` | If your etcd is not deployed as a pod, specify IPs it can be found on |
| kubeEtcd.service | object | `{"port":2381,"targetPort":2381}` | Etcd service. If using kubeEtcd.endpoints only the port and targetPort are used |
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
| kubeScheduler.endpoints | list | `[]` | If your kube scheduler is not deployed as a pod, specify IPs it can be found on |
| kubeScheduler.service | object | `{"port":10251,"targetPort":10251}` | If using kubeScheduler.endpoints only the port and targetPort are used |
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
| kubelet.serviceMonitor.resourcePath | string | `"/metrics/resource"` |  |
| kubelet.serviceMonitor.resourceRelabelings[0].sourceLabels[0] | string | `"__metrics_path__"` |  |
| kubelet.serviceMonitor.resourceRelabelings[0].targetLabel | string | `"metrics_path"` |  |
| nodeExporter.enabled | bool | `true` | Deploy node exporter as a daemonset to all nodes |
| nodeExporter.jobLabel | string | `"app.kubernetes.io/name"` |  |
| nodeExporter.serviceMonitor.interval | string | `""` |  |
| nodeExporter.serviceMonitor.metricRelabelings | list | `[]` |  |
| nodeExporter.serviceMonitor.relabelings[0].action | string | `"replace"` |  |
| nodeExporter.serviceMonitor.relabelings[0].replacement | string | `"node-exporter"` |  |
| nodeExporter.serviceMonitor.relabelings[0].sourceLabels[0] | string | `"job"` |  |
| nodeExporter.serviceMonitor.relabelings[0].targetLabel | string | `"job"` |  |
| nodeExporter.serviceMonitor.scrapeTimeout | string | `""` |  |
| otel-operator | object | `{"enabled":true}` | Values for included otel-operator chart |
| prometheus-operator | object | `{"enabled":true}` | Values for included prometheus-operator chart |
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
| prometheus.prometheusSpec.image.tag | string | `"v2.30.3"` |  |
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
| prometheus.prometheusSpec.version | string | `"v2.30.3"` |  |
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
| promtail | object | `{"enabled":false,"serviceMonitor":{"enabled":true,"labels":{"netic.dk/monitoring":"true"}}}` | Promtail is designed for Grafana Loki and is an alternative to Vector for log ingestion |
| vector-agent.enabled | bool | `true` |  |
| vector-agent.hostMetricsSource.enabled | bool | `false` |  |
| vector-agent.kubernetesLogsSource.rawConfig | string | `"annotation_fields.container_image = \"image\"\nannotation_fields.container_name = \"container\"\nannotation_fields.pod_labels = \"labels\"\nannotation_fields.pod_name = \"pod\"\nannotation_fields.pod_namespace = \"namespace\"\nannotation_fields.pod_node_name = \"node\"\nannotation_fields.pod_uid = \"name\"\n"` |  |
| vector-agent.prometheusSink.enabled | bool | `true` |  |
| vector-agent.prometheusSink.listenPort | int | `9090` |  |
| vector-agent.prometheusSink.podMonitor.enabled | bool | `false` |  |
| vector-agent.psp.enabled | bool | `true` |  |
| vector-agent.rbac.enabled | bool | `true` |  |
| vector-agent.vectorSink.enabled | bool | `false` |  |

## Development

See [DEVELOPMENT.md](../../DEVELOPMENT.md)
