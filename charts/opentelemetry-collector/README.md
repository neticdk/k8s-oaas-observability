# opentelemetry-collector

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.99.0](https://img.shields.io/badge/AppVersion-0.99.0-informational?style=flat-square)

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
| image.pullPolicy | string | `"Always"` |  |
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
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| service.ports.grpc.nodePort | int | `30317` |  |
| service.ports.grpc.port | int | `4317` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | ServiceAccount annotations. Use case: AWS EKS IAM roles for service accounts ref: https://docs.aws.amazon.com/eks/latest/userguide/specify-service-account-role.html |
| serviceAccount.create | bool | `true` | If true, create & use serviceAccount. Require rbac true |
| serviceAccount.imagePullSecrets | list | `[]` | Reference to one or more secrets to be used when pulling images ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| serviceAccount.name | string | `nil` | The name of the ServiceAccount to use. If not set and create is true, a name is generated using the fullname template |

## Development

See [DEVELOPMENT.md](../../DEVELOPMENT.md)
