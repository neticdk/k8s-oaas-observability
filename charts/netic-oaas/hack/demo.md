# Demo

## Preparation

```bash
cd charts/netic-oaas/hack
kind create cluster --name oaas --config kind-cluster.yaml
docker-compose up
```

## Actual Demo

1.  Install Helm chart
    ```bash
    helm upgrade -i -n netic-oaas-system --create-namespace oaas charts/netic-oaas
    ```
1. Show running Pods
1. Show in-cluster Prometheus (targets, rules)
1. Show in-cluster Grafana (dashbaords + explore)
1. Show simulated Vector receiver
1. Show simulated Grafana (show time series tags, show cluster selectable dashboards)
