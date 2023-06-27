# opentelemetry-collector

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.27.0](https://img.shields.io/badge/AppVersion-0.27.0-informational?style=flat-square)

A small Helm chart to install OpenTelemetry Collector

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add netic-oaas https://neticdk.github.io/k8s-oaas-observability
$ helm install my-release netic-oaas/opentelemetry-collector
```

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.exporters | object | `{}` |  |
| config.extensions.health_check.port | int | `13133` |  |
| config.extensions.zpages.endpoint | string | `"localhost:55679"` |  |
| config.receivers.otlp.protocols.grpc.endpoint | string | `"0.0.0.0:4317"` |  |
| config.receivers.otlp.protocols.http.endpoint | string | `"0.0.0.0:55681"` |  |
| config.service.extensions[0] | string | `"health_check"` |  |
| config.service.extensions[1] | string | `"zpages"` |  |
| config.service.pipelines | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"otel/opentelemetry-collector"` |  |
| image.tag | string | `""` |  |
| podSecurityContext.fsGroup | int | `10001` |  |
| podSecurityContext.runAsGroup | int | `10001` |  |
| podSecurityContext.runAsUser | int | `10001` |  |
| priorityClassName | string | `"secure-cloud-stack-technical-operations-critical"` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"2Gi"` |  |
| resources.requests.cpu | string | `"200m"` |  |
| resources.requests.memory | string | `"400Mi"` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| service.ports.grpc.nodePort | int | `30317` |  |
| service.ports.grpc.port | int | `4317` |  |
| service.type | string | `"ClusterIP"` |  |

## Development

See [DEVELOPMENT.md](../../DEVELOPMENT.md)
