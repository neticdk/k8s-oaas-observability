# oaas-observability

![Version: 2.1.26](https://img.shields.io/badge/Version-2.1.26-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

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
$ helm repo add netic-oaas https://neticdk.github.io/k8s-oaas-observability
$ helm install my-release netic-oaas/oaas-observability
```

## Source Code

* <https://github.com/neticdk/k8s-oaas-observability>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../prometheus-node-exporter | prometheus-node-exporter | * |
| file://../prometheus-operator | prometheus-operator | * |
| https://grafana.github.io/helm-charts | grafana | 7.0.3 |
| https://grafana.github.io/helm-charts | promtail | 6.15.3 |
| https://helm.vector.dev | vector-agent | 0.19.1 |
| https://open-telemetry.github.io/opentelemetry-helm-charts | opentelemetry-operator | 0.42.0 |
| https://prometheus-community.github.io/helm-charts | kube-state-metrics | 5.15.0 |

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alertmanager.alertmanagerSpec.additionalPeers | list | `[]` |  |
| alertmanager.alertmanagerSpec.affinity | object | `{}` |  |
| alertmanager.alertmanagerSpec.alertmanagerConfigNamespaceSelector | object | `{}` | Namespaces to be selected for AlertmanagerConfig discovery. If nil, only check own namespace. |
| alertmanager.alertmanagerSpec.alertmanagerConfigSelector | object | `{"matchLabels":{"netic.dk/monitoring":"true"}}` | AlertmanagerConfigs to be selected for to merge and configure Alertmanager with. |
| alertmanager.alertmanagerSpec.configMaps | list | `[]` | ConfigMaps is a list of ConfigMaps in the same namespace as the Alertmanager object, which shall be mounted into the Alertmanager Pods. The ConfigMaps are mounted into /etc/alertmanager/configmaps/. |
| alertmanager.alertmanagerSpec.configSecret | string | `""` |  |
| alertmanager.alertmanagerSpec.containers | list | `[]` |  |
| alertmanager.alertmanagerSpec.externalUrl | string | `nil` |  |
| alertmanager.alertmanagerSpec.image.repository | string | `"quay.io/prometheus/alertmanager"` |  |
| alertmanager.alertmanagerSpec.image.tag | string | `"v0.23.0"` |  |
| alertmanager.alertmanagerSpec.listenLocal | bool | `false` |  |
| alertmanager.alertmanagerSpec.logFormat | string | `"logfmt"` | Define Log Format Use 'logfmt' (default) or 'json-formatted' logging |
| alertmanager.alertmanagerSpec.logLevel | string | `"info"` | Log level for Alertmanager to be configured with. |
| alertmanager.alertmanagerSpec.nodeSelector | object | `{}` |  |
| alertmanager.alertmanagerSpec.paused | bool | `false` |  |
| alertmanager.alertmanagerSpec.podAntiAffinity | string | `""` |  |
| alertmanager.alertmanagerSpec.podAntiAffinityTopologyKey | string | `"kubernetes.io/hostname"` |  |
| alertmanager.alertmanagerSpec.portName | string | `"web"` |  |
| alertmanager.alertmanagerSpec.priorityClassName | string | `"secure-cloud-stack-technical-operations-critical"` |  |
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
| alertmanager.alertmanagerSpec.volumeMounts | list | `[]` |  |
| alertmanager.alertmanagerSpec.volumes | list | `[]` |  |
| alertmanager.apiVersion | string | `"v2"` | Api that prometheus will use to communicate with alertmanager. Possible values are v1, v2 |
| alertmanager.config | object | `{"global":{"resolve_timeout":"5m"},"receivers":[{"name":"null"}],"route":{"group_by":["job"],"group_interval":"5m","group_wait":"30s","receiver":"null","repeat_interval":"12h","routes":[{"match":{"alertname":"Watchdog"},"receiver":"null"}]}}` | Alertmanager configuration directives # ref: https://prometheus.io/docs/alerting/configuration/#configuration-file #      https://prometheus.io/webtools/alerting/routing-tree-editor/ # |
| alertmanager.enabled | bool | `true` | Deploy alertmanager |
| alertmanager.ingress.annotations | object | `{}` |  |
| alertmanager.ingress.enabled | bool | `false` |  |
| alertmanager.ingress.hosts | list | `[]` |  |
| alertmanager.ingress.labels | object | `{}` |  |
| alertmanager.ingress.pathType | string | `"ImplementationSpecific"` |  |
| alertmanager.ingress.paths | list | `[]` |  |
| alertmanager.ingress.tls | list | `[]` |  |
| alertmanager.ingressPerReplica.annotations | object | `{}` |  |
| alertmanager.ingressPerReplica.enabled | bool | `false` |  |
| alertmanager.ingressPerReplica.hostDomain | string | `""` |  |
| alertmanager.ingressPerReplica.hostPrefix | string | `""` |  |
| alertmanager.ingressPerReplica.labels | object | `{}` |  |
| alertmanager.ingressPerReplica.pathType | string | `"ImplementationSpecific"` |  |
| alertmanager.ingressPerReplica.paths | list | `[]` |  |
| alertmanager.ingressPerReplica.tlsSecretName | string | `""` |  |
| alertmanager.ingressPerReplica.tlsSecretPerReplica.enabled | bool | `false` |  |
| alertmanager.ingressPerReplica.tlsSecretPerReplica.prefix | string | `"alertmanager"` |  |
| alertmanager.podDisruptionBudget | object | `{"enabled":false,"maxUnavailable":"","minAvailable":1}` | Configure pod disruption budgets for Alertmanager # ref: https://kubernetes.io/docs/tasks/run-application/configure-pdb/#specifying-a-poddisruptionbudget # This configuration is immutable once created and will require the PDB to be deleted to be changed # https://github.com/kubernetes/kubernetes/issues/45398 # |
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
| alertmanager.serviceAccount | object | `{"annotations":{},"create":true,"name":""}` | Service account for Alertmanager to use. # ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/ # |
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
| coreDns.service.selector | object | `{}` |  |
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
| fullnameOverride | string | `""` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.networkPolicyEnabled | bool | `true` |  |
| global.rbac.create | bool | `true` |  |
| global.rbac.pspAnnotations | object | `{}` |  |
| global.rbac.pspEnabled | bool | `false` |  |
| global.serviceMonitor.labels | object | `{"netic.dk/monitoring":"true"}` | Labels to add to all service monitors |
| grafana.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| grafana.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| grafana.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| grafana.enabled | bool | `true` |  |
| grafana.image.pullPolicy | string | `"Always"` |  |
| grafana.priorityClassName | string | `"secure-cloud-stack-technical-operations-critical"` |  |
| grafana.resources.limits.memory | string | `"196Mi"` |  |
| grafana.resources.requests.cpu | string | `"200m"` |  |
| grafana.resources.requests.memory | string | `"196Mi"` |  |
| grafana.sidecar.dashboards.enabled | bool | `true` |  |
| grafana.sidecar.dashboards.label | string | `"netic_grafana_dashboard"` |  |
| grafana.sidecar.datasources.enabled | bool | `true` |  |
| grafana.sidecar.datasources.label | string | `"netic_grafana_datasource"` |  |
| grafana.sidecar.imagePullPolicy | string | `"Always"` |  |
| grafana.sidecar.resources.limits.memory | string | `"96Mi"` |  |
| grafana.sidecar.resources.requests.cpu | string | `"50m"` |  |
| grafana.sidecar.resources.requests.memory | string | `"96Mi"` |  |
| grafana.sidecar.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| grafana.sidecar.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| grafana.sidecar.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| grafana.testFramework.enabled | bool | `false` |  |
| kube-state-metrics | object | `{"containerSecurityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true},"image":{"pullPolicy":"Always"},"metricLabelsAllowlist":["nodes=[topology.kubernetes.io/region,topology.kubernetes.io/zone]"],"podSecurityPolicy":{"enabled":false},"priorityClassName":"secure-cloud-stack-technical-operations-critical","prometheus":{"monitor":{"additionalLabels":{"netic.dk/monitoring":"true"},"enabled":true,"honorLabels":true}},"resources":{"limits":{"memory":"64Mi"},"requests":{"cpu":"25m","memory":"64Mi"}},"securityContext":{"enabled":true}}` | Values for included kube-state-metrics chart |
| kubeApiServer.enabled | bool | `true` | Should api server be scraped |
| kubeApiServer.relabelings[0].action | string | `"replace"` |  |
| kubeApiServer.relabelings[0].replacement | string | `"kube-apiserver"` |  |
| kubeApiServer.relabelings[0].sourceLabels[0] | string | `"job"` |  |
| kubeApiServer.relabelings[0].targetLabel | string | `"job"` |  |
| kubeApiServer.serviceMonitor.interval | string | `""` |  |
| kubeApiServer.serviceMonitor.jobLabel | string | `"component"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[0].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[0].regex | string | `"kubelet_(pod_worker_latency_microseconds|pod_start_latency_microseconds|cgroup_manager_latency_microseconds|pod_worker_start_latency_microseconds|pleg_relist_latency_microseconds|pleg_relist_interval_microseconds|runtime_operations|runtime_operations_latency_microseconds|runtime_operations_errors|eviction_stats_age_microseconds|device_plugin_registration_count|device_plugin_alloc_latency_microseconds|network_plugin_operations_latency_microseconds)"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[10].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[10].regex | string | `"apiserver_admission_step_admission_latencies_seconds_.*"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[10].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[11].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[11].regex | string | `"apiserver_request_duration_seconds_bucket;(0.15|0.25|0.3|0.35|0.4|0.45|0.6|0.7|0.8|0.9|1.25|1.5|1.75|2.5|3|3.5|4.5|6|7|8|9|15|25|30|50)"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[11].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[11].sourceLabels[1] | string | `"le"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[1].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[1].regex | string | `"scheduler_(e2e_scheduling_latency_microseconds|scheduling_algorithm_predicate_evaluation|scheduling_algorithm_priority_evaluation|scheduling_algorithm_preemption_evaluation|scheduling_algorithm_latency_microseconds|binding_latency_microseconds|scheduling_latency_seconds)"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[1].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[2].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[2].regex | string | `"apiserver_(request_count|request_latencies|request_latencies_summary|dropped_requests|storage_data_key_generation_latencies_microseconds|storage_transformation_failures_total|storage_transformation_latencies_microseconds|proxy_tunnel_sync_latency_secs|longrunning_gauge|registered_watchers)"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[2].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[3].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[3].regex | string | `"kubelet_docker_(operations|operations_latency_microseconds|operations_errors|operations_timeout)"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[3].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[4].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[4].regex | string | `"reflector_(items_per_list|items_per_watch|list_duration_seconds|lists_total|short_watches_total|watch_duration_seconds|watches_total)"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[4].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[5].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[5].regex | string | `"etcd_(helper_cache_hit_count|helper_cache_miss_count|helper_cache_entry_count|object_counts|request_cache_get_latencies_summary|request_cache_add_latencies_summary|request_latencies_summary)"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[5].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[6].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[6].regex | string | `"transformation_(transformation_latencies_microseconds|failures_total)"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[6].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[7].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[7].regex | string | `"(admission_quota_controller_adds|admission_quota_controller_depth|admission_quota_controller_longest_running_processor_microseconds|admission_quota_controller_queue_latency|admission_quota_controller_unfinished_work_seconds|admission_quota_controller_work_duration|APIServiceOpenAPIAggregationControllerQueue1_adds|APIServiceOpenAPIAggregationControllerQueue1_depth|APIServiceOpenAPIAggregationControllerQueue1_longest_running_processor_microseconds|APIServiceOpenAPIAggregationControllerQueue1_queue_latency|APIServiceOpenAPIAggregationControllerQueue1_retries|APIServiceOpenAPIAggregationControllerQueue1_unfinished_work_seconds|APIServiceOpenAPIAggregationControllerQueue1_work_duration|APIServiceRegistrationController_adds|APIServiceRegistrationController_depth|APIServiceRegistrationController_longest_running_processor_microseconds|APIServiceRegistrationController_queue_latency|APIServiceRegistrationController_retries|APIServiceRegistrationController_unfinished_work_seconds|APIServiceRegistrationController_work_duration|autoregister_adds|autoregister_depth|autoregister_longest_running_processor_microseconds|autoregister_queue_latency|autoregister_retries|autoregister_unfinished_work_seconds|autoregister_work_duration|AvailableConditionController_adds|AvailableConditionController_depth|AvailableConditionController_longest_running_processor_microseconds|AvailableConditionController_queue_latency|AvailableConditionController_retries|AvailableConditionController_unfinished_work_seconds|AvailableConditionController_work_duration|crd_autoregistration_controller_adds|crd_autoregistration_controller_depth|crd_autoregistration_controller_longest_running_processor_microseconds|crd_autoregistration_controller_queue_latency|crd_autoregistration_controller_retries|crd_autoregistration_controller_unfinished_work_seconds|crd_autoregistration_controller_work_duration|crdEstablishing_adds|crdEstablishing_depth|crdEstablishing_longest_running_processor_microseconds|crdEstablishing_queue_latency|crdEstablishing_retries|crdEstablishing_unfinished_work_seconds|crdEstablishing_work_duration|crd_finalizer_adds|crd_finalizer_depth|crd_finalizer_longest_running_processor_microseconds|crd_finalizer_queue_latency|crd_finalizer_retries|crd_finalizer_unfinished_work_seconds|crd_finalizer_work_duration|crd_naming_condition_controller_adds|crd_naming_condition_controller_depth|crd_naming_condition_controller_longest_running_processor_microseconds|crd_naming_condition_controller_queue_latency|crd_naming_condition_controller_retries|crd_naming_condition_controller_unfinished_work_seconds|crd_naming_condition_controller_work_duration|crd_openapi_controller_adds|crd_openapi_controller_depth|crd_openapi_controller_longest_running_processor_microseconds|crd_openapi_controller_queue_latency|crd_openapi_controller_retries|crd_openapi_controller_unfinished_work_seconds|crd_openapi_controller_work_duration|DiscoveryController_adds|DiscoveryController_depth|DiscoveryController_longest_running_processor_microseconds|DiscoveryController_queue_latency|DiscoveryController_retries|DiscoveryController_unfinished_work_seconds|DiscoveryController_work_duration|kubeproxy_sync_proxy_rules_latency_microseconds|non_structural_schema_condition_controller_adds|non_structural_schema_condition_controller_depth|non_structural_schema_condition_controller_longest_running_processor_microseconds|non_structural_schema_condition_controller_queue_latency|non_structural_schema_condition_controller_retries|non_structural_schema_condition_controller_unfinished_work_seconds|non_structural_schema_condition_controller_work_duration|rest_client_request_latency_seconds|storage_operation_errors_total|storage_operation_status_count)"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[7].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[8].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[8].regex | string | `"etcd_(debugging|disk|server).*"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[8].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[9].action | string | `"drop"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[9].regex | string | `"apiserver_admission_controller_admission_latencies_seconds_.*"` |  |
| kubeApiServer.serviceMonitor.metricRelabelings[9].sourceLabels[0] | string | `"__name__"` |  |
| kubeApiServer.serviceMonitor.selector.matchLabels.component | string | `"apiserver"` |  |
| kubeApiServer.serviceMonitor.selector.matchLabels.provider | string | `"kubernetes"` |  |
| kubeApiServer.tlsConfig.insecureSkipVerify | bool | `false` |  |
| kubeApiServer.tlsConfig.serverName | string | `"kubernetes"` |  |
| kubeControllerManager.enabled | bool | `true` |  |
| kubeControllerManager.endpoints | list | `[]` |  |
| kubeControllerManager.service.port | int | `10252` |  |
| kubeControllerManager.service.selector | object | `{}` |  |
| kubeControllerManager.service.targetPort | int | `10252` |  |
| kubeControllerManager.serviceMonitor.https | bool | `true` |  |
| kubeControllerManager.serviceMonitor.insecureSkipVerify | bool | `true` |  |
| kubeControllerManager.serviceMonitor.interval | string | `""` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[0].action | string | `"drop"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[0].regex | string | `"kubelet_(pod_worker_latency_microseconds|pod_start_latency_microseconds|cgroup_manager_latency_microseconds|pod_worker_start_latency_microseconds|pleg_relist_latency_microseconds|pleg_relist_interval_microseconds|runtime_operations|runtime_operations_latency_microseconds|runtime_operations_errors|eviction_stats_age_microseconds|device_plugin_registration_count|device_plugin_alloc_latency_microseconds|network_plugin_operations_latency_microseconds)"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[1].action | string | `"drop"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[1].regex | string | `"scheduler_(e2e_scheduling_latency_microseconds|scheduling_algorithm_predicate_evaluation|scheduling_algorithm_priority_evaluation|scheduling_algorithm_preemption_evaluation|scheduling_algorithm_latency_microseconds|binding_latency_microseconds|scheduling_latency_seconds)"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[1].sourceLabels[0] | string | `"__name__"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[2].action | string | `"drop"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[2].regex | string | `"apiserver_(request_count|request_latencies|request_latencies_summary|dropped_requests|storage_data_key_generation_latencies_microseconds|storage_transformation_failures_total|storage_transformation_latencies_microseconds|proxy_tunnel_sync_latency_secs|longrunning_gauge|registered_watchers)"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[2].sourceLabels[0] | string | `"__name__"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[3].action | string | `"drop"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[3].regex | string | `"kubelet_docker_(operations|operations_latency_microseconds|operations_errors|operations_timeout)"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[3].sourceLabels[0] | string | `"__name__"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[4].action | string | `"drop"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[4].regex | string | `"reflector_(items_per_list|items_per_watch|list_duration_seconds|lists_total|short_watches_total|watch_duration_seconds|watches_total)"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[4].sourceLabels[0] | string | `"__name__"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[5].action | string | `"drop"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[5].regex | string | `"etcd_(helper_cache_hit_count|helper_cache_miss_count|helper_cache_entry_count|object_counts|request_cache_get_latencies_summary|request_cache_add_latencies_summary|request_latencies_summary)"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[5].sourceLabels[0] | string | `"__name__"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[6].action | string | `"drop"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[6].regex | string | `"transformation_(transformation_latencies_microseconds|failures_total)"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[6].sourceLabels[0] | string | `"__name__"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[7].action | string | `"drop"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[7].regex | string | `"(admission_quota_controller_adds|admission_quota_controller_depth|admission_quota_controller_longest_running_processor_microseconds|admission_quota_controller_queue_latency|admission_quota_controller_unfinished_work_seconds|admission_quota_controller_work_duration|APIServiceOpenAPIAggregationControllerQueue1_adds|APIServiceOpenAPIAggregationControllerQueue1_depth|APIServiceOpenAPIAggregationControllerQueue1_longest_running_processor_microseconds|APIServiceOpenAPIAggregationControllerQueue1_queue_latency|APIServiceOpenAPIAggregationControllerQueue1_retries|APIServiceOpenAPIAggregationControllerQueue1_unfinished_work_seconds|APIServiceOpenAPIAggregationControllerQueue1_work_duration|APIServiceRegistrationController_adds|APIServiceRegistrationController_depth|APIServiceRegistrationController_longest_running_processor_microseconds|APIServiceRegistrationController_queue_latency|APIServiceRegistrationController_retries|APIServiceRegistrationController_unfinished_work_seconds|APIServiceRegistrationController_work_duration|autoregister_adds|autoregister_depth|autoregister_longest_running_processor_microseconds|autoregister_queue_latency|autoregister_retries|autoregister_unfinished_work_seconds|autoregister_work_duration|AvailableConditionController_adds|AvailableConditionController_depth|AvailableConditionController_longest_running_processor_microseconds|AvailableConditionController_queue_latency|AvailableConditionController_retries|AvailableConditionController_unfinished_work_seconds|AvailableConditionController_work_duration|crd_autoregistration_controller_adds|crd_autoregistration_controller_depth|crd_autoregistration_controller_longest_running_processor_microseconds|crd_autoregistration_controller_queue_latency|crd_autoregistration_controller_retries|crd_autoregistration_controller_unfinished_work_seconds|crd_autoregistration_controller_work_duration|crdEstablishing_adds|crdEstablishing_depth|crdEstablishing_longest_running_processor_microseconds|crdEstablishing_queue_latency|crdEstablishing_retries|crdEstablishing_unfinished_work_seconds|crdEstablishing_work_duration|crd_finalizer_adds|crd_finalizer_depth|crd_finalizer_longest_running_processor_microseconds|crd_finalizer_queue_latency|crd_finalizer_retries|crd_finalizer_unfinished_work_seconds|crd_finalizer_work_duration|crd_naming_condition_controller_adds|crd_naming_condition_controller_depth|crd_naming_condition_controller_longest_running_processor_microseconds|crd_naming_condition_controller_queue_latency|crd_naming_condition_controller_retries|crd_naming_condition_controller_unfinished_work_seconds|crd_naming_condition_controller_work_duration|crd_openapi_controller_adds|crd_openapi_controller_depth|crd_openapi_controller_longest_running_processor_microseconds|crd_openapi_controller_queue_latency|crd_openapi_controller_retries|crd_openapi_controller_unfinished_work_seconds|crd_openapi_controller_work_duration|DiscoveryController_adds|DiscoveryController_depth|DiscoveryController_longest_running_processor_microseconds|DiscoveryController_queue_latency|DiscoveryController_retries|DiscoveryController_unfinished_work_seconds|DiscoveryController_work_duration|kubeproxy_sync_proxy_rules_latency_microseconds|non_structural_schema_condition_controller_adds|non_structural_schema_condition_controller_depth|non_structural_schema_condition_controller_longest_running_processor_microseconds|non_structural_schema_condition_controller_queue_latency|non_structural_schema_condition_controller_retries|non_structural_schema_condition_controller_unfinished_work_seconds|non_structural_schema_condition_controller_work_duration|rest_client_request_latency_seconds|storage_operation_errors_total|storage_operation_status_count)"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[7].sourceLabels[0] | string | `"__name__"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[8].action | string | `"drop"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[8].regex | string | `"etcd_(debugging|disk|request|server).*"` |  |
| kubeControllerManager.serviceMonitor.metricRelabelings[8].sourceLabels[0] | string | `"__name__"` |  |
| kubeControllerManager.serviceMonitor.relabelings | list | `[]` |  |
| kubeControllerManager.serviceMonitor.serverName | string | `"127.0.0.1"` |  |
| kubeDns.enabled | bool | `false` |  |
| kubeDns.service.dnsmasq.port | int | `10054` |  |
| kubeDns.service.dnsmasq.targetPort | int | `10054` |  |
| kubeDns.service.selector | object | `{}` |  |
| kubeDns.service.skydns.port | int | `10055` |  |
| kubeDns.service.skydns.targetPort | int | `10055` |  |
| kubeDns.serviceMonitor.dnsmasqMetricRelabelings | list | `[]` |  |
| kubeDns.serviceMonitor.dnsmasqRelabelings | list | `[]` |  |
| kubeDns.serviceMonitor.interval | string | `""` |  |
| kubeDns.serviceMonitor.metricRelabelings | list | `[]` |  |
| kubeDns.serviceMonitor.relabelings | list | `[]` |  |
| kubeEtcd.enabled | bool | `true` |  |
| kubeEtcd.endpoints | list | `[]` | If your etcd is not deployed as a pod, specify IPs it can be found on |
| kubeEtcd.service | object | `{"port":2381,"selector":{},"targetPort":2381}` | Etcd service. If using kubeEtcd.endpoints only the port and targetPort are used |
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
| kubeProxy.service.selector | object | `{}` |  |
| kubeProxy.service.targetPort | int | `10249` |  |
| kubeProxy.serviceMonitor.https | bool | `false` |  |
| kubeProxy.serviceMonitor.interval | string | `""` |  |
| kubeProxy.serviceMonitor.metricRelabelings | list | `[]` |  |
| kubeProxy.serviceMonitor.relabelings | list | `[]` |  |
| kubeScheduler.enabled | bool | `true` |  |
| kubeScheduler.endpoints | list | `[]` | If your kube scheduler is not deployed as a pod, specify IPs it can be found on |
| kubeScheduler.service | object | `{"port":10251,"selector":{},"targetPort":10251}` | If using kubeScheduler.endpoints only the port and targetPort are used |
| kubeScheduler.serviceMonitor.https | bool | `true` |  |
| kubeScheduler.serviceMonitor.insecureSkipVerify | bool | `true` |  |
| kubeScheduler.serviceMonitor.interval | string | `""` |  |
| kubeScheduler.serviceMonitor.metricRelabelings | list | `[]` |  |
| kubeScheduler.serviceMonitor.relabelings | list | `[]` |  |
| kubeScheduler.serviceMonitor.serverName | string | `"127.0.0.1"` |  |
| kubeVersionOverride | string | `""` |  |
| kubelet.enabled | bool | `true` |  |
| kubelet.namespace | string | `"kube-system"` |  |
| kubelet.serviceMonitor.cAdvisor | bool | `true` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[0].action | string | `"drop"` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[0].regex | string | `"container_(network_tcp_usage_total|network_udp_usage_total|tasks_state|cpu_load_average_10s)"` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[1].action | string | `"drop"` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[1].regex | string | `"(container_spec_.*|container_file_descriptors|container_sockets|container_threads_max|container_threads|container_start_time_seconds|container_last_seen);;"` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[1].sourceLabels[0] | string | `"__name__"` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[1].sourceLabels[1] | string | `"pod"` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[1].sourceLabels[2] | string | `"namespace"` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[2].action | string | `"drop"` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[2].regex | string | `"(container_blkio_device_usage_total);.+"` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[2].sourceLabels[0] | string | `"__name__"` |  |
| kubelet.serviceMonitor.cAdvisorMetricRelabelings[2].sourceLabels[1] | string | `"container"` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[0].sourceLabels[0] | string | `"__metrics_path__"` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[0].targetLabel | string | `"metrics_path"` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[1].action | string | `"replace"` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[1].replacement | string | `"cadvisor"` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[1].sourceLabels[0] | string | `"job"` |  |
| kubelet.serviceMonitor.cAdvisorRelabelings[1].targetLabel | string | `"job"` |  |
| kubelet.serviceMonitor.https | bool | `true` |  |
| kubelet.serviceMonitor.interval | string | `""` |  |
| kubelet.serviceMonitor.metricRelabelings[0].action | string | `"drop"` |  |
| kubelet.serviceMonitor.metricRelabelings[0].regex | string | `"kubelet_(pod_worker_latency_microseconds|pod_start_latency_microseconds|cgroup_manager_latency_microseconds|pod_worker_start_latency_microseconds|pleg_relist_latency_microseconds|pleg_relist_interval_microseconds|runtime_operations|runtime_operations_latency_microseconds|runtime_operations_errors|eviction_stats_age_microseconds|device_plugin_registration_count|device_plugin_alloc_latency_microseconds|network_plugin_operations_latency_microseconds)"` |  |
| kubelet.serviceMonitor.metricRelabelings[0].sourceLabels[0] | string | `"__name__"` |  |
| kubelet.serviceMonitor.metricRelabelings[1].action | string | `"drop"` |  |
| kubelet.serviceMonitor.metricRelabelings[1].regex | string | `"scheduler_(e2e_scheduling_latency_microseconds|scheduling_algorithm_predicate_evaluation|scheduling_algorithm_priority_evaluation|scheduling_algorithm_preemption_evaluation|scheduling_algorithm_latency_microseconds|binding_latency_microseconds|scheduling_latency_seconds)"` |  |
| kubelet.serviceMonitor.metricRelabelings[1].sourceLabels[0] | string | `"__name__"` |  |
| kubelet.serviceMonitor.metricRelabelings[2].action | string | `"drop"` |  |
| kubelet.serviceMonitor.metricRelabelings[2].regex | string | `"apiserver_(request_count|request_latencies|request_latencies_summary|dropped_requests|storage_data_key_generation_latencies_microseconds|storage_transformation_failures_total|storage_transformation_latencies_microseconds|proxy_tunnel_sync_latency_secs|longrunning_gauge|registered_watchers)"` |  |
| kubelet.serviceMonitor.metricRelabelings[2].sourceLabels[0] | string | `"__name__"` |  |
| kubelet.serviceMonitor.metricRelabelings[3].action | string | `"drop"` |  |
| kubelet.serviceMonitor.metricRelabelings[3].regex | string | `"kubelet_docker_(operations|operations_latency_microseconds|operations_errors|operations_timeout)"` |  |
| kubelet.serviceMonitor.metricRelabelings[3].sourceLabels[0] | string | `"__name__"` |  |
| kubelet.serviceMonitor.metricRelabelings[4].action | string | `"drop"` |  |
| kubelet.serviceMonitor.metricRelabelings[4].regex | string | `"reflector_(items_per_list|items_per_watch|list_duration_seconds|lists_total|short_watches_total|watch_duration_seconds|watches_total)"` |  |
| kubelet.serviceMonitor.metricRelabelings[4].sourceLabels[0] | string | `"__name__"` |  |
| kubelet.serviceMonitor.metricRelabelings[5].action | string | `"drop"` |  |
| kubelet.serviceMonitor.metricRelabelings[5].regex | string | `"etcd_(helper_cache_hit_count|helper_cache_miss_count|helper_cache_entry_count|object_counts|request_cache_get_latencies_summary|request_cache_add_latencies_summary|request_latencies_summary)"` |  |
| kubelet.serviceMonitor.metricRelabelings[5].sourceLabels[0] | string | `"__name__"` |  |
| kubelet.serviceMonitor.metricRelabelings[6].action | string | `"drop"` |  |
| kubelet.serviceMonitor.metricRelabelings[6].regex | string | `"transformation_(transformation_latencies_microseconds|failures_total)"` |  |
| kubelet.serviceMonitor.metricRelabelings[6].sourceLabels[0] | string | `"__name__"` |  |
| kubelet.serviceMonitor.metricRelabelings[7].action | string | `"drop"` |  |
| kubelet.serviceMonitor.metricRelabelings[7].regex | string | `"(admission_quota_controller_adds|admission_quota_controller_depth|admission_quota_controller_longest_running_processor_microseconds|admission_quota_controller_queue_latency|admission_quota_controller_unfinished_work_seconds|admission_quota_controller_work_duration|APIServiceOpenAPIAggregationControllerQueue1_adds|APIServiceOpenAPIAggregationControllerQueue1_depth|APIServiceOpenAPIAggregationControllerQueue1_longest_running_processor_microseconds|APIServiceOpenAPIAggregationControllerQueue1_queue_latency|APIServiceOpenAPIAggregationControllerQueue1_retries|APIServiceOpenAPIAggregationControllerQueue1_unfinished_work_seconds|APIServiceOpenAPIAggregationControllerQueue1_work_duration|APIServiceRegistrationController_adds|APIServiceRegistrationController_depth|APIServiceRegistrationController_longest_running_processor_microseconds|APIServiceRegistrationController_queue_latency|APIServiceRegistrationController_retries|APIServiceRegistrationController_unfinished_work_seconds|APIServiceRegistrationController_work_duration|autoregister_adds|autoregister_depth|autoregister_longest_running_processor_microseconds|autoregister_queue_latency|autoregister_retries|autoregister_unfinished_work_seconds|autoregister_work_duration|AvailableConditionController_adds|AvailableConditionController_depth|AvailableConditionController_longest_running_processor_microseconds|AvailableConditionController_queue_latency|AvailableConditionController_retries|AvailableConditionController_unfinished_work_seconds|AvailableConditionController_work_duration|crd_autoregistration_controller_adds|crd_autoregistration_controller_depth|crd_autoregistration_controller_longest_running_processor_microseconds|crd_autoregistration_controller_queue_latency|crd_autoregistration_controller_retries|crd_autoregistration_controller_unfinished_work_seconds|crd_autoregistration_controller_work_duration|crdEstablishing_adds|crdEstablishing_depth|crdEstablishing_longest_running_processor_microseconds|crdEstablishing_queue_latency|crdEstablishing_retries|crdEstablishing_unfinished_work_seconds|crdEstablishing_work_duration|crd_finalizer_adds|crd_finalizer_depth|crd_finalizer_longest_running_processor_microseconds|crd_finalizer_queue_latency|crd_finalizer_retries|crd_finalizer_unfinished_work_seconds|crd_finalizer_work_duration|crd_naming_condition_controller_adds|crd_naming_condition_controller_depth|crd_naming_condition_controller_longest_running_processor_microseconds|crd_naming_condition_controller_queue_latency|crd_naming_condition_controller_retries|crd_naming_condition_controller_unfinished_work_seconds|crd_naming_condition_controller_work_duration|crd_openapi_controller_adds|crd_openapi_controller_depth|crd_openapi_controller_longest_running_processor_microseconds|crd_openapi_controller_queue_latency|crd_openapi_controller_retries|crd_openapi_controller_unfinished_work_seconds|crd_openapi_controller_work_duration|DiscoveryController_adds|DiscoveryController_depth|DiscoveryController_longest_running_processor_microseconds|DiscoveryController_queue_latency|DiscoveryController_retries|DiscoveryController_unfinished_work_seconds|DiscoveryController_work_duration|kubeproxy_sync_proxy_rules_latency_microseconds|non_structural_schema_condition_controller_adds|non_structural_schema_condition_controller_depth|non_structural_schema_condition_controller_longest_running_processor_microseconds|non_structural_schema_condition_controller_queue_latency|non_structural_schema_condition_controller_retries|non_structural_schema_condition_controller_unfinished_work_seconds|non_structural_schema_condition_controller_work_duration|rest_client_request_latency_seconds|storage_operation_errors_total|storage_operation_status_count)"` |  |
| kubelet.serviceMonitor.metricRelabelings[7].sourceLabels[0] | string | `"__name__"` |  |
| kubelet.serviceMonitor.probes | bool | `true` |  |
| kubelet.serviceMonitor.probesMetricRelabelings | list | `[]` |  |
| kubelet.serviceMonitor.probesRelabelings[0].sourceLabels[0] | string | `"__metrics_path__"` |  |
| kubelet.serviceMonitor.probesRelabelings[0].targetLabel | string | `"metrics_path"` |  |
| kubelet.serviceMonitor.relabelings[0].sourceLabels[0] | string | `"__metrics_path__"` |  |
| kubelet.serviceMonitor.relabelings[0].targetLabel | string | `"metrics_path"` |  |
| kubelet.serviceMonitor.resource | bool | `false` |  |
| kubelet.serviceMonitor.resourceMetricRelabelings | list | `[]` |  |
| kubelet.serviceMonitor.resourcePath | string | `"/metrics/resource"` |  |
| kubelet.serviceMonitor.resourceRelabelings[0].sourceLabels[0] | string | `"__metrics_path__"` |  |
| kubelet.serviceMonitor.resourceRelabelings[0].targetLabel | string | `"metrics_path"` |  |
| kubelet.serviceMonitor.scrapeTimeout | string | `""` |  |
| nameOverride | string | `""` |  |
| nodeExporter.enabled | bool | `true` | Deploy node exporter as a daemonset to all nodes |
| nodeExporter.jobLabel | string | `"app.kubernetes.io/name"` |  |
| nodeExporter.serviceMonitor.interval | string | `""` |  |
| nodeExporter.serviceMonitor.metricRelabelings | list | `[]` |  |
| nodeExporter.serviceMonitor.relabelings[0].action | string | `"replace"` |  |
| nodeExporter.serviceMonitor.relabelings[0].replacement | string | `"node-exporter"` |  |
| nodeExporter.serviceMonitor.relabelings[0].sourceLabels[0] | string | `"job"` |  |
| nodeExporter.serviceMonitor.relabelings[0].targetLabel | string | `"job"` |  |
| nodeExporter.serviceMonitor.scrapeTimeout | string | `""` |  |
| opentelemetry-operator | object | `{"enabled":true,"kubeRBACProxy":{"securityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]}}},"manager":{"collectorImage":{"repository":"ghcr.io/open-telemetry/opentelemetry-collector-releases/opentelemetry-collector-contrib"},"securityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]}}},"priorityClassName":"secure-cloud-stack-technical-operations-critical"}` | Values for included otel-operator chart |
| priorityclass.enabled | bool | `true` |  |
| priorityclass.name | string | `"secure-cloud-stack-technical-operations-critical"` |  |
| priorityclass.value | int | `500000000` |  |
| prometheus-operator | object | `{"enabled":true,"prometheusOperator":{"image":{"pullPolicy":"Always"},"resources":{"limits":{"memory":"80Mi"},"requests":{"cpu":"25m","memory":"80Mi"}}}}` | Values for included prometheus-operator chart |
| prometheus.agent | bool | `false` | Sets up Prometheus to run in agent mode only running discovery, scrape and remote write |
| prometheus.annotations | object | `{}` |  |
| prometheus.ingress.annotations | object | `{}` |  |
| prometheus.ingress.enabled | bool | `false` |  |
| prometheus.ingress.hosts | list | `[]` |  |
| prometheus.ingress.labels | object | `{}` |  |
| prometheus.ingress.pathType | string | `"ImplementationSpecific"` |  |
| prometheus.ingress.paths | list | `[]` |  |
| prometheus.ingress.tls | list | `[]` |  |
| prometheus.podDisruptionBudget.enabled | bool | `false` |  |
| prometheus.podDisruptionBudget.maxUnavailable | string | `""` |  |
| prometheus.podDisruptionBudget.minAvailable | int | `1` |  |
| prometheus.podSecurityPolicy.allowedCapabilities | list | `[]` |  |
| prometheus.prometheusSpec.additionalScrapeConfigs | list | `[]` |  |
| prometheus.prometheusSpec.affinity | object | `{}` |  |
| prometheus.prometheusSpec.alertingEndpoints | list | `[]` |  |
| prometheus.prometheusSpec.apiserverConfig | object | `{}` |  |
| prometheus.prometheusSpec.configMaps | list | `[]` |  |
| prometheus.prometheusSpec.containers | list | `[]` |  |
| prometheus.prometheusSpec.disableCompaction | bool | `false` |  |
| prometheus.prometheusSpec.enableAdminAPI | bool | `false` |  |
| prometheus.prometheusSpec.enforcedNamespaceLabel | string | `""` |  |
| prometheus.prometheusSpec.evaluationInterval | string | `""` |  |
| prometheus.prometheusSpec.externalLabels.cluster | string | `"dummy"` |  |
| prometheus.prometheusSpec.externalUrl | string | `""` |  |
| prometheus.prometheusSpec.image.repository | string | `"quay.io/prometheus/prometheus"` |  |
| prometheus.prometheusSpec.image.tag | string | `"v2.36.2"` |  |
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
| prometheus.prometheusSpec.priorityClassName | string | `"secure-cloud-stack-technical-operations-critical"` |  |
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
| prometheus.prometheusSpec.version | string | `"v2.36.2"` |  |
| prometheus.prometheusSpec.volumeMounts | list | `[]` |  |
| prometheus.prometheusSpec.volumes | list | `[]` |  |
| prometheus.prometheusSpec.walCompression | bool | `false` |  |
| prometheus.service.additionalPorts | list | `[]` |  |
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
| prometheus.serviceAccount.annotations | object | `{}` |  |
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
| vector-agent.customConfig.api.address | string | `"0.0.0.0:8686"` |  |
| vector-agent.customConfig.api.enabled | bool | `true` |  |
| vector-agent.customConfig.api.playground | bool | `false` |  |
| vector-agent.customConfig.data_dir | string | `"/vector-data-dir"` |  |
| vector-agent.customConfig.log_schema.host_key | string | `"node"` |  |
| vector-agent.customConfig.log_schema.message_key | string | `"message"` |  |
| vector-agent.customConfig.log_schema.source_type_key | string | `"source_type"` |  |
| vector-agent.customConfig.log_schema.timestamp_key | string | `"timestamp"` |  |
| vector-agent.customConfig.sinks.prometheus_sink.address | string | `"0.0.0.0:9090"` |  |
| vector-agent.customConfig.sinks.prometheus_sink.inputs[0] | string | `"metric_cardinality"` |  |
| vector-agent.customConfig.sinks.prometheus_sink.type | string | `"prometheus"` |  |
| vector-agent.customConfig.sources.internal_metrics.type | string | `"internal_metrics"` |  |
| vector-agent.customConfig.sources.kubernetes_logs.pod_annotation_fields.container_image | string | `"image"` |  |
| vector-agent.customConfig.sources.kubernetes_logs.pod_annotation_fields.container_name | string | `"container"` |  |
| vector-agent.customConfig.sources.kubernetes_logs.pod_annotation_fields.pod_labels | string | `"labels"` |  |
| vector-agent.customConfig.sources.kubernetes_logs.pod_annotation_fields.pod_name | string | `"pod"` |  |
| vector-agent.customConfig.sources.kubernetes_logs.pod_annotation_fields.pod_namespace | string | `"namespace"` |  |
| vector-agent.customConfig.sources.kubernetes_logs.pod_annotation_fields.pod_node_name | string | `"node"` |  |
| vector-agent.customConfig.sources.kubernetes_logs.pod_annotation_fields.pod_uid | string | `"name"` |  |
| vector-agent.customConfig.sources.kubernetes_logs.type | string | `"kubernetes_logs"` |  |
| vector-agent.customConfig.transforms.metric_cardinality.inputs[0] | string | `"internal_metrics"` |  |
| vector-agent.customConfig.transforms.metric_cardinality.mode | string | `"exact"` |  |
| vector-agent.customConfig.transforms.metric_cardinality.type | string | `"tag_cardinality_limit"` |  |
| vector-agent.enabled | bool | `true` |  |
| vector-agent.image.pullPolicy | string | `"Always"` |  |
| vector-agent.livenessProbe.failureThreshold | int | `3` |  |
| vector-agent.livenessProbe.httpGet.path | string | `"/health"` |  |
| vector-agent.livenessProbe.httpGet.port | int | `8686` |  |
| vector-agent.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| vector-agent.livenessProbe.initialDelaySeconds | int | `10` |  |
| vector-agent.livenessProbe.periodSeconds | int | `30` |  |
| vector-agent.livenessProbe.timeoutSeconds | int | `5` |  |
| vector-agent.podPriorityClassName | string | `"secure-cloud-stack-technical-operations-critical"` |  |
| vector-agent.psp.enabled | bool | `false` |  |
| vector-agent.rbac.enabled | bool | `true` |  |
| vector-agent.readinessProbe.failureThreshold | int | `3` |  |
| vector-agent.readinessProbe.httpGet.path | string | `"/health"` |  |
| vector-agent.readinessProbe.httpGet.port | int | `8686` |  |
| vector-agent.readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| vector-agent.readinessProbe.initialDelaySeconds | int | `10` |  |
| vector-agent.readinessProbe.periodSeconds | int | `30` |  |
| vector-agent.readinessProbe.timeoutSeconds | int | `5` |  |
| vector-agent.resources.limits.memory | string | `"64Mi"` |  |
| vector-agent.resources.requests.cpu | string | `"150m"` |  |
| vector-agent.resources.requests.memory | string | `"64Mi"` |  |
| vector-agent.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| vector-agent.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| vector-agent.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| vectorMonitor | object | `{"metricRelabelings":null,"relabelings":[{"action":"labeldrop","regex":"__meta_kubernetes_pod_label_skaffold_dev.*"},{"action":"labeldrop","regex":"__meta_kubernetes_pod_label_pod_template_hash.*"},{"action":"labelmap","regex":"__meta_kubernetes_pod_label_(.+)"}]}` | Configuration for monitoring of Vector |
| vectorMonitor.metricRelabelings | string | `nil` | Metrics relabelling for Vector |
| vectorMonitor.relabelings | list | `[{"action":"labeldrop","regex":"__meta_kubernetes_pod_label_skaffold_dev.*"},{"action":"labeldrop","regex":"__meta_kubernetes_pod_label_pod_template_hash.*"},{"action":"labelmap","regex":"__meta_kubernetes_pod_label_(.+)"}]` | Relabellings for Vector |

## Development

See [DEVELOPMENT.md](../../DEVELOPMENT.md)
