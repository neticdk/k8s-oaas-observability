# otel-operator

![Version: 0.2.6](https://img.shields.io/badge/Version-0.2.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.56.0](https://img.shields.io/badge/AppVersion-v0.56.0-informational?style=flat-square)

**DEPRECATED** We recommend using: https://github.com/open-telemetry/opentelemetry-helm-charts/tree/main/charts/opentelemetry-operator

Install the OpenTelemetry Operator to create OpenTelemetry Collector instances

**Homepage:** <https://github.com/neticdk/k8s-oaas-observability>

## Installing the Chart

**NB**: This chart needs cert-manager. See [oaas-obvervability](../oaas-observability/README.md).

To install the chart with the release name `my-release`:

```bash
$ helm repo add netic-oaas https://neticdk.github.io/k8s-oaas-observability
$ helm install my-release netic-oaas/otel-operator
```

## Source Code

* <https://github.com/neticdk/k8s-oaas-observability>

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `""` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.networkPolicyEnabled | bool | `true` |  |
| global.podSecurityPolicy.annotations | object | `{}` |  |
| global.priorityClassName | string | `"secure-cloud-stack-technical-operations-critical"` |  |
| global.rbac.create | bool | `true` |  |
| global.rbac.pspEnabled | bool | `false` |  |
| nameOverride | string | `""` |  |
| opentelemetryOperator.affinity | object | `{}` |  |
| opentelemetryOperator.controllerManagerMetricsService.annotations | object | `{}` |  |
| opentelemetryOperator.controllerManagerMetricsService.enabled | bool | `true` |  |
| opentelemetryOperator.controllerManagerMetricsService.port | int | `8443` |  |
| opentelemetryOperator.enabled | bool | `true` |  |
| opentelemetryOperator.kubeRbacProxy.args.logtostderr | bool | `true` |  |
| opentelemetryOperator.kubeRbacProxy.args.securelistenaddress | string | `"0.0.0.0:8443"` |  |
| opentelemetryOperator.kubeRbacProxy.args.upstream | string | `"http://127.0.0.1:8080/"` |  |
| opentelemetryOperator.kubeRbacProxy.args.v | int | `10` |  |
| opentelemetryOperator.kubeRbacProxy.enabled | bool | `true` |  |
| opentelemetryOperator.kubeRbacProxy.image.pullPolicy | string | `"Always"` |  |
| opentelemetryOperator.kubeRbacProxy.image.repository | string | `"gcr.io/kubebuilder/kube-rbac-proxy"` |  |
| opentelemetryOperator.kubeRbacProxy.image.tag | string | `"v0.5.0"` |  |
| opentelemetryOperator.kubeRbacProxy.resources.limits.memory | string | `"16Mi"` |  |
| opentelemetryOperator.kubeRbacProxy.resources.requests.cpu | string | `"10m"` |  |
| opentelemetryOperator.kubeRbacProxy.resources.requests.memory | string | `"16Mi"` |  |
| opentelemetryOperator.kubeRbacProxy.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| opentelemetryOperator.kubeRbacProxy.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| opentelemetryOperator.kubeRbacProxy.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| opentelemetryOperator.manager.args.metricsaddr | string | `"127.0.0.1:8080"` |  |
| opentelemetryOperator.manager.image.pullPolicy | string | `"Always"` |  |
| opentelemetryOperator.manager.image.repository | string | `"ghcr.io/open-telemetry/opentelemetry-operator/opentelemetry-operator"` |  |
| opentelemetryOperator.manager.image.tag | string | `nil` |  |
| opentelemetryOperator.manager.resources.limits.memory | string | `"64Mi"` |  |
| opentelemetryOperator.manager.resources.requests.cpu | string | `"100m"` |  |
| opentelemetryOperator.manager.resources.requests.memory | string | `"64Mi"` |  |
| opentelemetryOperator.manager.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| opentelemetryOperator.manager.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| opentelemetryOperator.manager.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| opentelemetryOperator.nodeSelector | object | `{}` |  |
| opentelemetryOperator.podLabels | object | `{}` |  |
| opentelemetryOperator.podSecurityContext.fsGroup | int | `1` |  |
| opentelemetryOperator.podSecurityContext.runAsUser | int | `65532` |  |
| opentelemetryOperator.podSecurityContext.supplementalGroups[0] | int | `1` |  |
| opentelemetryOperator.serviceAccount.annotations | object | `{}` |  |
| opentelemetryOperator.serviceAccount.create | bool | `true` |  |
| opentelemetryOperator.serviceAccount.name | string | `""` |  |
| opentelemetryOperator.tolerations | list | `[]` |  |
| opentelemetryOperator.webhookService.annotations | object | `{}` |  |
| opentelemetryOperator.webhookService.enabled | bool | `true` |  |
| opentelemetryOperator.webhookService.port | int | `443` |  |
