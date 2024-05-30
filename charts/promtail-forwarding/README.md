# promtail-forwarding

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart to install promtail together with OpenTelemetry Collector for receiving and forwarding logs

**Homepage:** <https://github.com/neticdk/k8s-oaas-observability>

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add netic-oaas https://neticdk.github.io/k8s-oaas-observability
$ helm install my-release netic-oaas/promtail-forwarding
```

## Source Code

* <https://github.com/neticdk/k8s-oaas-observability>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://grafana.github.io/helm-charts | promtail | 6.15.5 |
| https://open-telemetry.github.io/opentelemetry-helm-charts | opentelemetry-collector | 0.92.0 |

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| collectorConfig | string | `"exporters:\n  debug: {}\nextensions:\n  health_check:\n    endpoint: ${env:MY_POD_IP}:13133\nprocessors:\n  batch: {}\n  memory_limiter:\n    check_interval: 5s\n    limit_percentage: 80\n    spike_limit_percentage: 25\nreceivers:\n  loki:\n    protocols:\n      grpc:\n        endpoint: ${env:MY_POD_IP}:3600\n      http:\n        endpoint: ${env:MY_POD_IP}:3500\n    use_incoming_timestamp: true\nservice:\n  extensions:\n  - health_check\n  pipelines:\n    logs:\n      exporters:\n      - debug\n      processors:\n      - memory_limiter\n      - batch\n      receivers:\n      - loki\n  telemetry:\n    metrics:\n      address: ${env:MY_POD_IP}:8888\n"` |  |
| opentelemetry-collector.configMap.create | bool | `false` |  |
| opentelemetry-collector.configMap.existingName | string | `"true"` |  |
| opentelemetry-collector.image.repository | string | `"otel/opentelemetry-collector-contrib"` |  |
| opentelemetry-collector.mode | string | `"deployment"` |  |
| opentelemetry-collector.podSecurityContext.fsGroup | int | `65534` |  |
| opentelemetry-collector.podSecurityContext.runAsGroup | int | `65534` |  |
| opentelemetry-collector.podSecurityContext.runAsNonRoot | bool | `true` |  |
| opentelemetry-collector.podSecurityContext.runAsUser | int | `65534` |  |
| opentelemetry-collector.ports.jaeger-compact.enabled | bool | `false` |  |
| opentelemetry-collector.ports.jaeger-grpc.enabled | bool | `false` |  |
| opentelemetry-collector.ports.jaeger-thrift.enabled | bool | `false` |  |
| opentelemetry-collector.ports.loki-grpc.appProtocol | string | `"grpc"` |  |
| opentelemetry-collector.ports.loki-grpc.containerPort | int | `3600` |  |
| opentelemetry-collector.ports.loki-grpc.enabled | bool | `true` |  |
| opentelemetry-collector.ports.loki-grpc.hostPort | int | `3600` |  |
| opentelemetry-collector.ports.loki-grpc.protocol | string | `"TCP"` |  |
| opentelemetry-collector.ports.loki-grpc.servicePort | int | `3600` |  |
| opentelemetry-collector.ports.loki-http.containerPort | int | `3500` |  |
| opentelemetry-collector.ports.loki-http.enabled | bool | `true` |  |
| opentelemetry-collector.ports.loki-http.hostPort | int | `3500` |  |
| opentelemetry-collector.ports.loki-http.protocol | string | `"TCP"` |  |
| opentelemetry-collector.ports.loki-http.servicePort | int | `3500` |  |
| opentelemetry-collector.ports.otlp-http.enabled | bool | `false` |  |
| opentelemetry-collector.ports.otlp.enabled | bool | `false` |  |
| opentelemetry-collector.ports.zipkin.enabled | bool | `false` |  |
| opentelemetry-collector.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| opentelemetry-collector.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| opentelemetry-collector.securityContext.privileged | bool | `false` |  |
| opentelemetry-collector.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| promtail.config.enabled | bool | `false` |  |
| promtail.config.file | string | `"server:\n  log_level: info\n  log_format: logfmt\n  http_listen_port: 3101\n\nclients:\n  - url: http://{{ include \"promtail-forwarding.opentelemetry-servicename\" . }}:3500/loki/api/v1/push\n\npositions:\n  filename: /run/promtail/positions.yaml\n\nscrape_configs:\n  # See also https://github.com/grafana/loki/blob/master/production/ksonnet/promtail/scrape_config.libsonnet for reference\n  - job_name: kubernetes-pods\n    pipeline_stages:\n      - cri: {}\n      - pack:\n          labels:\n          - app\n          - filename\n          - job\n          - pod\n          - container\n          - node_name\n          - version\n    kubernetes_sd_configs:\n      - role: pod\n    relabel_configs:\n      - source_labels:\n          - __meta_kubernetes_pod_controller_name\n        regex: ([0-9a-z-.]+?)(-[0-9a-f]{8,10})?\n        action: replace\n        target_label: __tmp_controller_name\n      - source_labels:\n          - __meta_kubernetes_pod_label_app_kubernetes_io_name\n          - __meta_kubernetes_pod_label_app\n          - __tmp_controller_name\n          - __meta_kubernetes_pod_name\n        regex: ^;*([^;]+)(;.*)?$\n        action: replace\n        target_label: app\n      - source_labels:\n          - __meta_kubernetes_pod_label_app_kubernetes_io_instance\n          - __meta_kubernetes_pod_label_instance\n        regex: ^;*([^;]+)(;.*)?$\n        action: replace\n        target_label: instance\n      - source_labels:\n          - __meta_kubernetes_pod_label_app_kubernetes_io_component\n          - __meta_kubernetes_pod_label_component\n        regex: ^;*([^;]+)(;.*)?$\n        action: replace\n        target_label: component\n      - action: replace\n        source_labels:\n        - __meta_kubernetes_pod_node_name\n        target_label: node_name\n      - action: replace\n        source_labels:\n        - __meta_kubernetes_namespace\n        target_label: namespace\n      - action: replace\n        replacement: $1\n        separator: /\n        source_labels:\n        - namespace\n        - app\n        target_label: job\n      - action: replace\n        source_labels:\n        - __meta_kubernetes_pod_name\n        target_label: pod\n      - action: replace\n        source_labels:\n        - __meta_kubernetes_pod_container_name\n        target_label: container\n      - action: replace\n        replacement: /var/log/pods/*$1/*.log\n        separator: /\n        source_labels:\n        - __meta_kubernetes_pod_uid\n        - __meta_kubernetes_pod_container_name\n        target_label: __path__\n      - action: replace\n        regex: true/(.*)\n        replacement: /var/log/pods/*$1/*.log\n        separator: /\n        source_labels:\n        - __meta_kubernetes_pod_annotationpresent_kubernetes_io_config_hash\n        - __meta_kubernetes_pod_annotation_kubernetes_io_config_hash\n        - __meta_kubernetes_pod_container_name\n        target_label: __path__\n      - action: replace\n        replacement: netic-internal_prod1_$1\n        source_labels:\n        - namespace\n        target_label: namespace_id\n      - action: replace\n        regex: ^;*([^;]+)(;.*)?$\n        source_labels:\n        - __meta_kubernetes_pod_label_app_kubernetes_io_version\n        - __meta_kubernetes_pod_label_version\n        target_label: version\n\nlimits_config:\n\ntracing:\n  enabled: false\n"` |  |
| promtail.configmap.enabled | bool | `true` |  |

## Development

See [DEVELOPMENT.md](../../DEVELOPMENT.md)
