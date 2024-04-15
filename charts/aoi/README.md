# aoi

![Version: 0.1.15](https://img.shields.io/badge/Version-0.1.15-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for Netic application operations infrastructure

**Homepage:** <https://github.com/neticdk/k8s-oaas-observability>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| alex5517 | <ash@netic.dk> |  |
| mathiasfm | <mfm@netic.dk> |  |

## Source Code

* <https://github.com/neticdk/k8s-oaas-observability>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://grafana.github.io/helm-charts | grafana | 7.3.7 |
| https://victoriametrics.github.io/helm-charts/ | victoria-metrics-alert | 0.9.4 |
| https://victoriametrics.github.io/helm-charts/ | victoria-metrics-single-1(victoria-metrics-single) | 0.9.17 |
| https://victoriametrics.github.io/helm-charts/ | victoria-metrics-single-2(victoria-metrics-single) | 0.9.17 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alerting.clusterId | string | `""` | Value of the label (cluster_id) |
| alerting.clusterWideNamespace.bootstrapConfig | object | `{"externalSecretsStore":{},"git":{"bitbucket":{},"github":{},"gitlab":{}},"vault":{}}` | overwrite options configured in global.bootstrapConfig |
| alerting.clusterWideNamespace.bootstrapConfig.externalSecretsStore | object | `{}` | overwrite externalSecretStore options, make sure to include all options in overwrite, it is not merged with globally defined options. |
| alerting.clusterWideNamespace.bootstrapConfig.git.github | object | `{}` | overwrite git options, make sure to include all options in overwrite, it is not merged with globally defined options. |
| alerting.clusterWideNamespace.bootstrapConfig.vault | object | `{}` | overwrite vault options, make sure to include all options in overwrite, it is not merged with globally defined options. |
| alerting.clusterWideNamespace.enabled | bool | `false` | Create alerting namespace for cluster-wide alert definitions |
| alerting.clusterWideNamespace.name | string | `"application-operations-alerting"` |  |
| alerting.clusterWideNamespace.projectBootstrap | object | `{"git":{}}` | Options to configure the projectBootstrap used for cluster-wide alert namespace. |
| alerting.enabled | bool | `false` | Enable deploying alerting components |
| alerting.helmRelease | object | `{"values":{"alertmanager":{"configReloader":{"image":{"pullPolicy":"Always","registry":"ghcr.io","repository":"neticdk/inotifywait-reloader","tag":"v0.0.2"},"resources":{"limits":{"memory":"96Mi"},"requests":{"cpu":"10m","memory":"96Mi"}},"securityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true}},"image":{"pullPolicy":"Always","registry":"docker.io","repository":"prom/alertmanager","tag":"v0.27.0"},"podSecurityContext":{"fsGroup":2000,"runAsGroup":3000,"runAsUser":1000},"priorityClassName":"secure-cloud-stack-tenant-namespace-application-critical","resources":{"limits":{"memory":"64Mi"},"requests":{"cpu":"10m","memory":"64Mi"}},"securityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true}},"server":{"configReloader":{"image":{"pullPolicy":"Always","registry":"docker.io","repository":"kiwigrid/k8s-sidecar","tag":"1.26.1@sha256:b8d5067137fec093cf48670dc3a1dbb38f9e734f3a6683015c2e89a45db5fd16"},"resources":{"limits":{"memory":"96Mi"},"requests":{"cpu":"10m","memory":"96Mi"}},"securityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true}},"image":{"pullPolicy":"Always","registry":"docker.io","repository":"victoriametrics/vmalert"},"podSecurityContext":{"fsGroup":2000,"runAsGroup":3000,"runAsUser":1000},"priorityClassName":"secure-cloud-stack-tenant-namespace-application-critical","resources":{"limits":{"memory":"64Mi"},"requests":{"cpu":"10m","memory":"64Mi"}},"securityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["all"]},"readOnlyRootFilesystem":true}}}}` | Values to configure for the victoria-metrics-alert helm chart. https://github.com/VictoriaMetrics/helm-charts/blob/master/charts/victoria-metrics-alert/values.yaml |
| alerting.helmRepository | string | `nil` | Override the default helmRepository used to deploy alerting components |
| alerting.namespaces | list | `[]` | List of namespaces which should have alerting components deployed |
| authProxy.affinity | list | `[]` |  |
| authProxy.annotations | object | `{}` |  |
| authProxy.enabled | bool | `true` | Enable filtering of Prometheus Queries based on client JWT token (Grafana) |
| authProxy.extraArgs | list | `[]` |  |
| authProxy.extraEnv | list | `[]` |  |
| authProxy.extraEnvFrom | list | `[]` |  |
| authProxy.image.registry | string | `"registry.netic.dk"` |  |
| authProxy.image.repository | string | `"netic-oaas/cortex-proxy"` |  |
| authProxy.image.tag | string | `"v1.0.4"` |  |
| authProxy.nodeSelector | object | `{}` |  |
| authProxy.podAnnotations | object | `{}` |  |
| authProxy.podLabels | object | `{}` |  |
| authProxy.podManagementPolicy | string | `"Parallel"` |  |
| authProxy.podSecurityContext.fsGroup | int | `2000` |  |
| authProxy.podSecurityContext.runAsGroup | int | `3000` |  |
| authProxy.podSecurityContext.runAsNonRoot | bool | `true` |  |
| authProxy.podSecurityContext.runAsUser | int | `1000` |  |
| authProxy.priorityClassName | string | `nil` |  |
| authProxy.replicas | int | `1` |  |
| authProxy.resources.limits.memory | string | `"64Mi"` |  |
| authProxy.resources.requests.cpu | string | `"100m"` |  |
| authProxy.resources.requests.memory | string | `"64Mi"` |  |
| authProxy.selectorLabels | object | `{}` |  |
| authProxy.service.annotations | object | `{}` |  |
| authProxy.service.labels | object | `{}` |  |
| authProxy.terminationGracePeriodSeconds | int | `30` |  |
| authProxy.tolerations | list | `[]` |  |
| authProxy.topologySpauthProxyConstraints | list | `[]` |  |
| dashboards.bootstrapConfig | object | `{"externalSecretsStore":{},"git":{"bitbucket":{},"github":{},"gitlab":{}},"vault":{}}` | overwrite options configured in global.bootstrapConfig |
| dashboards.bootstrapConfig.externalSecretsStore | object | `{}` | overwrite externalSecretStore options, make sure to include all options in overwrite, it is not merged with globally defined options. |
| dashboards.bootstrapConfig.git.github | object | `{}` | overwrite git options, make sure to include all options in overwrite, it is not merged with globally defined options. |
| dashboards.bootstrapConfig.vault | object | `{}` | overwrite vault options, make sure to include all options in overwrite, it is not merged with globally defined options. |
| dashboards.projectBootstrap | object | `{"git":{}}` | Options to configure the projectBootstrap used for tenant dashboard namespace |
| externalSecret.vaultDataFromKey | string | `nil` |  |
| externalSecret.vaultMountPath | string | `nil` |  |
| externalSecret.vaultPath | string | `nil` |  |
| externalSecret.vaultServer | string | `nil` |  |
| global.annotations | object | `{}` |  |
| global.bootstrapConfig | object | `{"externalSecretsStore":{},"git":{"bitbucket":{},"flavor":"github","github":{},"gitlab":{}},"vault":{}}` | Options to configure the bootstrapConfig globally can be overwritten for dashboards and clusterWideNamespace alerting namespace. .Values.dashboards.bootstrapConfig .Values.alerting.clusterWideNamespace.bootstrapConfig |
| global.bootstrapConfig.git.flavor | string | `"github"` | Which git flavor to use, currently only supports github, gitlab and bitbucket |
| global.clusterDomain | string | `"cluster.local"` |  |
| global.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| global.containerSecurityContext.capabilities.drop[0] | string | `"all"` |  |
| global.image.pullPolicy | string | `"Always"` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.podAnnotations | object | `{}` |  |
| global.podLabels | object | `{}` |  |
| global.priorityClassName | string | `nil` | Default priorityClassName to use |
| global.revisionHistoryLimit | int | `5` |  |
| global.serviceAnnotations | object | `{}` |  |
| global.serviceLabels | object | `{}` |  |
| global.tsdb.high_availability.enabled | bool | `false` | Enable high-availability for tsdb (Victoria-metrics-single) |
| grafana.enabled | bool | `true` | If true deploy Grafana for tenant dashboards |
| grafana.image.pullPolicy | string | `"Always"` |  |
| grafana.ingress.enabled | bool | `false` |  |
| grafana.ingress.fqdn | string | `nil` |  |
| grafana.podPortName | string | `"http"` |  |
| grafana.priorityClassName | string | `"secure-cloud-stack-tenant-namespace-application-critical"` |  |
| grafana.resources.limits.memory | string | `"256Mi"` |  |
| grafana.resources.requests.cpu | string | `"100m"` |  |
| grafana.resources.requests.memory | string | `"256Mi"` |  |
| grafana.sidecar.dashboards.enabled | bool | `true` |  |
| grafana.sidecar.dashboards.folderAnnotation | string | `"grafana_dashboard_folder"` | override grafana folder using annotation |
| grafana.sidecar.dashboards.label | string | `"application-operations-dashboards"` | Load configmaps with label key |
| grafana.sidecar.dashboards.provider.disableDelete | bool | `true` |  |
| grafana.sidecar.dashboards.provider.foldersFromFilesStructure | bool | `true` |  |
| grafana.sidecar.dashboards.searchNamespace | list | `["application-operations-dashboards"]` | Watch for configmaps in namespaces |
| grafana.sidecar.datasources.enabled | bool | `true` |  |
| grafana.sidecar.datasources.label | string | `"aoi_grafana_datasource"` |  |
| grafana.sidecar.image.pullPolicy | string | `"Always"` |  |
| grafana.testFramework.enabled | bool | `false` |  |
| prometheus.configReloader.resources.limits.memory | string | `"25Mi"` |  |
| prometheus.configReloader.resources.requests.cpu | string | `"10m"` |  |
| prometheus.configReloader.resources.requests.memory | string | `"25Mi"` |  |
| prometheus.externalLabels | object | `{}` | labels to add to all metrics. externalLabels:   cluster_id: "${cluster_provider}_${cluster_name}"   cluster: ${cluster_name}   cluster_type: "${cluster_type}"   prometheus_cluster: ${cluster_name}/aoi-prometheus   provider: "${cluster_provider}" |
| prometheus.extraVolumeMounts | list | `[]` |  |
| prometheus.extraVolumes | list | `[]` |  |
| prometheus.image.registry | string | `"docker.io"` |  |
| prometheus.image.repository | string | `"victoriametrics/vmagent"` |  |
| prometheus.image.tag | string | `"v1.100.1@sha256:18959c254d474d150fd74534b8183e1a800d18d673a408b0c7d20e3febe6f4fe"` |  |
| prometheus.persistence.size | string | `"60Gi"` |  |
| prometheus.podAnnotations | object | `{}` |  |
| prometheus.podSecurityContext.fsGroup | int | `2000` |  |
| prometheus.podSecurityContext.runAsGroup | int | `3000` |  |
| prometheus.podSecurityContext.runAsNonRoot | bool | `true` |  |
| prometheus.podSecurityContext.runAsUser | int | `1000` |  |
| prometheus.priorityClassName | string | `nil` |  |
| prometheus.relabelConfig | string | `"- source_labels: [cluster_id, namespace]\n  separator: _\n  regex: (.*)\n  target_label: namespace_id\n  replacement: $1\n  action: replace\n"` | relabel configs to apply to samples before ingestion. |
| prometheus.resources.limits.memory | string | `"768Mi"` |  |
| prometheus.resources.requests.cpu | string | `"100m"` |  |
| prometheus.resources.requests.memory | string | `"256Mi"` |  |
| promxy.affinity | list | `[]` |  |
| promxy.annotations | object | `{}` |  |
| promxy.config | string | `"##\n### Promxy configuration\n##\npromxy:\n  server_groups:\n    - static_configs:\n        - targets:\n          - victoria-metrics-single-1-server.{{ .Release.Namespace }}.svc.{{ .Values.global.clusterDomain }}:8428\n      labels:\n        replica: 1\n      http_client:\n        dial_timeout: 1s\n      ignore_error: true\n      remote_read: true\n      remote_read_path: /api/v1\n    - static_configs:\n        - targets:\n          - victoria-metrics-single-2-server.{{ .Release.Namespace }}.svc.{{ .Values.global.clusterDomain }}:8428\n      labels:\n        replica: 2\n      http_client:\n        dial_timeout: 1s\n      ignore_error: true\n      remote_read: true\n      remote_read_path: /api/v1\n"` |  |
| promxy.extraArgs | list | `[]` |  |
| promxy.extraEnv | list | `[]` |  |
| promxy.extraEnvFrom | list | `[]` |  |
| promxy.image.registry | string | `"quay.io"` |  |
| promxy.image.repository | string | `"jacksontj/promxy"` |  |
| promxy.image.tag | string | `"v0.0.85@sha256:115686ce1eb8e37696304b191ce33f13db1c0d7ec8f3ef36501f12bb74f83b9e"` |  |
| promxy.nodeSelector | object | `{}` |  |
| promxy.podAnnotations | object | `{}` |  |
| promxy.podLabels | object | `{}` |  |
| promxy.podManagementPolicy | string | `"Parallel"` |  |
| promxy.podSecurityContext.fsGroup | int | `2000` |  |
| promxy.podSecurityContext.runAsGroup | int | `3000` |  |
| promxy.podSecurityContext.runAsNonRoot | bool | `true` |  |
| promxy.podSecurityContext.runAsUser | int | `1000` |  |
| promxy.priorityClassName | string | `nil` |  |
| promxy.replicas | int | `1` |  |
| promxy.resources.limits.memory | string | `"64Mi"` |  |
| promxy.resources.requests.cpu | string | `"50m"` |  |
| promxy.resources.requests.memory | string | `"64Mi"` |  |
| promxy.selectorLabels | object | `{}` |  |
| promxy.service.annotations | object | `{}` |  |
| promxy.service.labels | object | `{}` |  |
| promxy.terminationGracePeriodSeconds | int | `30` |  |
| promxy.tolerations | list | `[]` |  |
| promxy.topologySpauthProxyConstraints | list | `[]` |  |
| victoria-metrics-alert.rbac.create | bool | `false` |  |
| victoria-metrics-alert.server.configMap | string | `"null"` |  |
| victoria-metrics-alert.server.enabled | bool | `false` |  |
| victoria-metrics-alert.serviceAccount.create | bool | `false` |  |
| victoria-metrics-single-1.rbac.create | bool | `false` |  |
| victoria-metrics-single-1.server.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].key | string | `"app.kubernetes.io/name"` |  |
| victoria-metrics-single-1.server.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| victoria-metrics-single-1.server.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].values[0] | string | `"victoria-metrics-single-2"` |  |
| victoria-metrics-single-1.server.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].topologyKey | string | `"topology.kubernetes.io/zone"` |  |
| victoria-metrics-single-1.server.image.pullPolicy | string | `"Always"` |  |
| victoria-metrics-single-1.server.podSecurityContext.fsGroup | int | `2000` |  |
| victoria-metrics-single-1.server.podSecurityContext.runAsGroup | int | `3000` |  |
| victoria-metrics-single-1.server.podSecurityContext.runAsUser | int | `1000` |  |
| victoria-metrics-single-1.server.resources.limits.memory | string | `"1024Mi"` |  |
| victoria-metrics-single-1.server.resources.requests.cpu | string | `"200m"` |  |
| victoria-metrics-single-1.server.resources.requests.memory | string | `"1024Mi"` |  |
| victoria-metrics-single-1.server.retentionPeriod | string | `"90d"` | Data retention period |
| victoria-metrics-single-1.server.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| victoria-metrics-single-1.server.securityContext.capabilities.drop[0] | string | `"all"` |  |
| victoria-metrics-single-1.server.serviceMonitor.enabled | bool | `true` |  |
| victoria-metrics-single-1.server.serviceMonitor.extraLabels."netic.dk/monitoring" | string | `"true"` |  |
| victoria-metrics-single-2.rbac.create | bool | `false` |  |
| victoria-metrics-single-2.server.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].key | string | `"app.kubernetes.io/name"` |  |
| victoria-metrics-single-2.server.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| victoria-metrics-single-2.server.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].values[0] | string | `"victoria-metrics-single-1"` |  |
| victoria-metrics-single-2.server.affinity.podAntiAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].topologyKey | string | `"topology.kubernetes.io/zone"` |  |
| victoria-metrics-single-2.server.image.pullPolicy | string | `"Always"` |  |
| victoria-metrics-single-2.server.podSecurityContext.fsGroup | int | `2000` |  |
| victoria-metrics-single-2.server.podSecurityContext.runAsGroup | int | `3000` |  |
| victoria-metrics-single-2.server.podSecurityContext.runAsUser | int | `1000` |  |
| victoria-metrics-single-2.server.resources.limits.memory | string | `"1024Mi"` |  |
| victoria-metrics-single-2.server.resources.requests.cpu | string | `"200m"` |  |
| victoria-metrics-single-2.server.resources.requests.memory | string | `"1024Mi"` |  |
| victoria-metrics-single-2.server.retentionPeriod | string | `"90d"` | Data retention period |
| victoria-metrics-single-2.server.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| victoria-metrics-single-2.server.securityContext.capabilities.drop[0] | string | `"all"` |  |
| victoria-metrics-single-2.server.serviceMonitor.enabled | bool | `true` |  |
| victoria-metrics-single-2.server.serviceMonitor.extraLabels."netic.dk/monitoring" | string | `"true"` |  |
| victoriaMetrics.persistentVolume.size | string | `"5Gi"` | Size of the volume. Should be calculated based on the metrics you send and retention policy you set. |

