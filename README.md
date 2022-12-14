# Kubernetes Observability Stack

The repository contains components and Helm charts to deploy a standard observability stack
to a Kubernetes cluster consisting of log collection, metrics, and traces.

## TL;DR

Install the main Helm chart `oaas-observability` by adding the Helm repository and doing an install
as so:

```bash
$ helm repo add netic-oaas https://neticdk.github.io/k8s-oaas-observability
$ helm install my-release netic-oaas/oaas-observability
```

Details is found in the [oass-observability](./charts/oaas-observability) chart documentation. See also a more thorough
description of [Operation as a Service (OaaS)](oaas.md).

