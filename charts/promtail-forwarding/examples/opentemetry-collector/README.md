# OpenTelemetry Collector as Receiver

This example shows how to forward log data to another OpenTelemetry Collector instance
for further processing.

```sh
helm repo add netic-oaas https://neticdk.github.io/k8s-oaas-observability
helm upgrade -i promtail-forwarding netic-oaas/promtail-forwarding -f promtail-forwarding.yaml

helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm upgrade -i opentelemetry-collector open-telemetry/opentelemetry-collector --set mode=deployment --set image.repository=otel/opentelemetry-collector-k8s --set networkPolicy.enabled=true
```
