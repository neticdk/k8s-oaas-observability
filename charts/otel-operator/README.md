# otel-operator

![Version: 0.1.5](https://img.shields.io/badge/Version-0.1.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.23.0](https://img.shields.io/badge/AppVersion-0.23.0-informational?style=flat-square)

Install the OpenTelemetry Operator to create OpenTelemetry Collector instances

**Homepage:** <https://github.com/neticdk/k8s-oaas-observability>

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add netic-oaas http://neticdk.github.io/k8s-oaas-observability
$ helm install my-release netic-oaas/otel-operator
```

## Source Code

* <https://github.com/neticdk/k8s-oaas-observability>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../cert-manager-crds | cert-manager-crds | * |
| https://charts.jetstack.io | cert-manager | v1.3.1 |

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cert-manager.enabled | bool | `false` |  |
| cert-manager.installCRDs | bool | `false` |  |
| fullnameOverride | string | `""` |  |
| global.rbac.create | bool | `true` |  |
| global.rbac.imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| opentelemetryOperator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].key | string | `"another-node-label-key"` |  |
| opentelemetryOperator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].operator | string | `"In"` |  |
| opentelemetryOperator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].preference.matchExpressions[0].values[0] | string | `"another-node-label-value"` |  |
| opentelemetryOperator.affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight | int | `1` |  |
| opentelemetryOperator.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].key | string | `"kubernetes.io/e2e-az-name"` |  |
| opentelemetryOperator.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].operator | string | `"In"` |  |
| opentelemetryOperator.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].values[0] | string | `"e2e-az1"` |  |
| opentelemetryOperator.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].values[1] | string | `"e2e-az2"` |  |
| opentelemetryOperator.controllerManagerMetricsService.annotations | object | `{}` |  |
| opentelemetryOperator.controllerManagerMetricsService.enabled | bool | `true` |  |
| opentelemetryOperator.controllerManagerMetricsService.port | int | `8443` |  |
| opentelemetryOperator.enabled | bool | `true` |  |
| opentelemetryOperator.kubeRbacProxy.args.logtostderr | bool | `true` |  |
| opentelemetryOperator.kubeRbacProxy.args.securelistenaddress | string | `"0.0.0.0:8443"` |  |
| opentelemetryOperator.kubeRbacProxy.args.upstream | string | `"http://127.0.0.1:8080/"` |  |
| opentelemetryOperator.kubeRbacProxy.args.v | int | `10` |  |
| opentelemetryOperator.kubeRbacProxy.enabled | bool | `true` |  |
| opentelemetryOperator.kubeRbacProxy.image.pullPolicy | string | `"IfNotPresent"` |  |
| opentelemetryOperator.kubeRbacProxy.image.repository | string | `"gcr.io/kubebuilder/kube-rbac-proxy"` |  |
| opentelemetryOperator.kubeRbacProxy.image.tag | string | `"v0.5.0"` |  |
| opentelemetryOperator.kubeRbacProxy.rbac.create | bool | `true` |  |
| opentelemetryOperator.kubeRbacProxy.resources | object | `{}` |  |
| opentelemetryOperator.kubeRbacProxy.securityContext | object | `{}` |  |
| opentelemetryOperator.manager.args.metricsaddr | string | `"127.0.0.1:8080"` |  |
| opentelemetryOperator.manager.enabled | bool | `true` |  |
| opentelemetryOperator.manager.image.pullPolicy | string | `"IfNotPresent"` |  |
| opentelemetryOperator.manager.image.repository | string | `"quay.io/opentelemetry/opentelemetry-operator"` |  |
| opentelemetryOperator.manager.image.tag | string | `"0.23.0"` |  |
| opentelemetryOperator.manager.rbac.create | bool | `true` |  |
| opentelemetryOperator.manager.resources.limits.cpu | string | `"100m"` |  |
| opentelemetryOperator.manager.resources.limits.memory | string | `"30Mi"` |  |
| opentelemetryOperator.manager.resources.requests.cpu | string | `"100m"` |  |
| opentelemetryOperator.manager.resources.requests.memory | string | `"20Mi"` |  |
| opentelemetryOperator.manager.securityContext | object | `{}` |  |
| opentelemetryOperator.nodeSelector.disktype | string | `"ssd"` |  |
| opentelemetryOperator.podLabels | object | `{}` |  |
| opentelemetryOperator.podSecurityContext | object | `{}` |  |
| opentelemetryOperator.serviceAccount.annotations | object | `{}` |  |
| opentelemetryOperator.serviceAccount.create | bool | `true` |  |
| opentelemetryOperator.serviceAccount.name | string | `""` |  |
| opentelemetryOperator.tolerations[0].effect | string | `"NoSchedule"` |  |
| opentelemetryOperator.tolerations[0].key | string | `"ex"` |  |
| opentelemetryOperator.tolerations[0].operator | string | `"Exists"` |  |
| opentelemetryOperator.webhookService.annotations | object | `{}` |  |
| opentelemetryOperator.webhookService.enabled | bool | `true` |  |
| opentelemetryOperator.webhookService.port | int | `443` |  |
