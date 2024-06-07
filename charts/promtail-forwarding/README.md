# promtail-forwarding

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

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
| https://open-telemetry.github.io/opentelemetry-helm-charts | opentelemetry-collector | 0.93.1 |

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| collectorConfig | string | `"exporters:\n{{- if .Values.otelExporter.endpoint }}\n  otlphttp:\n    endpoint: {{ .Values.otelExporter.endpoint }}\n    tls:\n      insecure: true\n{{- else }}\n  debug: {}\n{{- end }}\nextensions:\n  health_check:\n    endpoint: ${env:MY_POD_IP}:13133\nprocessors:\n  batch: {}\n  memory_limiter:\n    check_interval: 5s\n    limit_percentage: 80\n    spike_limit_percentage: 25\nreceivers:\n  loki:\n    protocols:\n      grpc:\n        endpoint: ${env:MY_POD_IP}:3600\n      http:\n        endpoint: ${env:MY_POD_IP}:3500\n    use_incoming_timestamp: true\nservice:\n  extensions:\n  - health_check\n  pipelines:\n    logs:\n      exporters:\n{{- if .Values.otelExporter.endpoint }}\n      - otlphttp\n{{- else }}\n      - debug\n{{- end }}\n      processors:\n      - memory_limiter\n      - batch\n      receivers:\n      - loki\n  telemetry:\n    metrics:\n      address: ${env:MY_POD_IP}:8888\n"` | OpenTelemetry Collector yaml configuration. The input will be run through the Helm templating engine. |
| opentelemetry-collector.configMap | object | `{"create":false,"existingName":"true"}` | set up configuration matching the Promtail configuration |
| opentelemetry-collector.image | object | `{"pullPolicy":"Always","repository":"otel/opentelemetry-collector-contrib"}` | image must be "contrib" to include the Loki receiver |
| opentelemetry-collector.mode | string | `"deployment"` | should be deployet as Kubernetes "deployment" |
| opentelemetry-collector.networkPolicy.allowIngressFrom[0].podSelector | object | `{}` |  |
| opentelemetry-collector.networkPolicy.enabled | bool | `true` |  |
| opentelemetry-collector.podSecurityContext | object | `{"fsGroup":65534,"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534}` | setting up strict security contexts |
| opentelemetry-collector.ports | object | `{"jaeger-compact":{"enabled":false},"jaeger-grpc":{"enabled":false},"jaeger-thrift":{"enabled":false},"loki-grpc":{"appProtocol":"grpc","containerPort":3600,"enabled":true,"hostPort":3600,"protocol":"TCP","servicePort":3600},"loki-http":{"containerPort":3500,"enabled":true,"hostPort":3500,"protocol":"TCP","servicePort":3500},"metrics":{"enabled":true},"otlp":{"enabled":false},"otlp-http":{"enabled":false},"zipkin":{"enabled":false}}` | only setup up port to receive Loki protocol |
| opentelemetry-collector.priorityClassName | string | `"secure-cloud-stack-technical-operations-critical"` |  |
| opentelemetry-collector.resources | object | `{"limits":{"memory":"48Mi"},"requests":{"cpu":"5m","memory":"48Mi"}}` | default resource allocation should be overriden |
| opentelemetry-collector.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true}` | setting up strict security contexts |
| otelExporter.endpoint | string | `nil` | Endpoint for OTEL export |
| otelExporter.networkPolicy | object | `{"enabled":false,"port":4318,"to":null}` | Proprties to configure egress network policy |
| promtail.config.enabled | bool | `false` | The configuration is rendered by this chart so it should not be rendered by the included Promtail chart |
| promtail.config.file | string | `"server:\n  log_level: info\n  log_format: logfmt\n  http_listen_port: 3101\n\nclients:\n  - url: http://{{ include \"promtail-forwarding.opentelemetry-servicename\" . }}:3500/loki/api/v1/push\n\npositions:\n  filename: /run/promtail/positions.yaml\n\nscrape_configs:\n  # See also https://github.com/grafana/loki/blob/master/production/ksonnet/promtail/scrape_config.libsonnet for reference\n  - job_name: kubernetes-pods\n    pipeline_stages:\n      - cri: {}\n    kubernetes_sd_configs:\n      - role: pod\n    relabel_configs:\n      - source_labels:\n          - __meta_kubernetes_pod_controller_name\n        regex: ([0-9a-z-.]+?)(-[0-9a-f]{8,10})?\n        action: replace\n        target_label: __tmp_controller_name\n      - source_labels:\n          - __meta_kubernetes_pod_label_app_kubernetes_io_name\n          - __meta_kubernetes_pod_label_app\n          - __tmp_controller_name\n          - __meta_kubernetes_pod_name\n        regex: ^;*([^;]+)(;.*)?$\n        action: replace\n        target_label: app\n      - source_labels:\n          - __meta_kubernetes_pod_label_app_kubernetes_io_instance\n          - __meta_kubernetes_pod_label_instance\n        regex: ^;*([^;]+)(;.*)?$\n        action: replace\n        target_label: instance\n      - source_labels:\n          - __meta_kubernetes_pod_label_app_kubernetes_io_component\n          - __meta_kubernetes_pod_label_component\n        regex: ^;*([^;]+)(;.*)?$\n        action: replace\n        target_label: component\n      - action: replace\n        source_labels:\n        - __meta_kubernetes_pod_node_name\n        target_label: node_name\n      - action: replace\n        source_labels:\n        - __meta_kubernetes_namespace\n        target_label: namespace\n      - action: replace\n        replacement: $1\n        separator: /\n        source_labels:\n        - namespace\n        - app\n        target_label: job\n      - action: replace\n        source_labels:\n        - __meta_kubernetes_pod_name\n        target_label: pod\n      - action: replace\n        source_labels:\n        - __meta_kubernetes_pod_container_name\n        target_label: container\n      - action: replace\n        replacement: /var/log/pods/*$1/*.log\n        separator: /\n        source_labels:\n        - __meta_kubernetes_pod_uid\n        - __meta_kubernetes_pod_container_name\n        target_label: __path__\n      - action: replace\n        regex: true/(.*)\n        replacement: /var/log/pods/*$1/*.log\n        separator: /\n        source_labels:\n        - __meta_kubernetes_pod_annotationpresent_kubernetes_io_config_hash\n        - __meta_kubernetes_pod_annotation_kubernetes_io_config_hash\n        - __meta_kubernetes_pod_container_name\n        target_label: __path__\n      - action: replace\n        regex: ^;*([^;]+)(;.*)?$\n        source_labels:\n        - __meta_kubernetes_pod_label_app_kubernetes_io_version\n        - __meta_kubernetes_pod_label_version\n        target_label: version\n\nlimits_config:\n\ntracing:\n  enabled: false\n"` | The default yaml configuration. This can be overriden to filter or otherwise change the Promtail configuration. Note that the configuration sets up the OpenTelemetry Collector as target for the log data. |
| promtail.configmap.enabled | bool | `true` |  |
| promtail.image.pullPolicy | string | `"Always"` |  |
| promtail.networkPolicy.enabled | bool | `true` |  |
| promtail.priorityClassName | string | `"secure-cloud-stack-technical-operations-critical"` |  |
| promtail.resources | object | `{"limits":{"memory":"64Mi"},"requests":{"cpu":"10m","memory":"64Mi"}}` | Default resources should be overriden based on the usage |

## Development

See [DEVELOPMENT.md](../../DEVELOPMENT.md)
