# Fluentbit as Receiver

Example of setting up Fluentbit as receiver of OpenTelemetry log data. The example sets up
Fluentbit to receive logs over the OpenTelemetry protocol and just print the incoming logs
to standard out.

The corresponding configuration for the `promtail-forwarding` chart is also included as part
of the example.

```sh
helm repo add netic-oaas https://neticdk.github.io/k8s-oaas-observability
helm upgrade -i promtail-forwarding netic-oaas/promtail-forwarding -f promtail-forwarding.yaml

helm repo add fluent https://fluent.github.io/helm-charts
helm upgrade -i fluent-bit fluent/fluent-bit -f fluentbit.yaml 
```
