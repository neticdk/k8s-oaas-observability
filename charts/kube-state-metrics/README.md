# kube-state-metrics

![Version: 1.0.20](https://img.shields.io/badge/Version-1.0.20-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.12.0](https://img.shields.io/badge/AppVersion-v2.12.0-informational?style=flat-square)

Install kube-state-metrics to generate and expose cluster-level metrics. Since this is now part of the Prometheus community
Helm charts this has been deprecated and wont be maintained.
See https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-state-metrics

**Homepage:** <https://github.com/kubernetes/kube-state-metrics>

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add netic-oaas https://neticdk.github.io/k8s-oaas-observability
$ helm install my-release netic-oaas/kube-state-metrics
```

## Source Code

* <https://github.com/kubernetes/kube-state-metrics>
* <https://github.com/neticdk/k8s-oaas-observability/tree/main/charts/kube-state-metrics>

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod assignment Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/ |
| autosharding | object | `{"enabled":false}` | Set to true to automatically shard data across replicas pods ([Automated Sharding](https://github.com/kubernetes/kube-state-metrics#automated-sharding)). EXPERIMENTAL |
| collectors | list | `["certificatesigningrequests","configmaps","cronjobs","daemonsets","deployments","endpoints","horizontalpodautoscalers","ingresses","jobs","limitranges","mutatingwebhookconfigurations","namespaces","networkpolicies","nodes","persistentvolumeclaims","persistentvolumes","poddisruptionbudgets","pods","replicasets","replicationcontrollers","resourcequotas","secrets","services","statefulsets","storageclasses","validatingwebhookconfigurations","volumeattachments"]` | Available collectors for kube-state-metrics |
| customLabels | object | `{}` | Custom labels to apply to service, deployment and pods |
| global.networkPolicyEnabled | bool | `false` | Deploy network policy allowing ingress. |
| hostNetwork | bool | `false` | Whether or not to use the host network |
| image.pullPolicy | string | `"Always"` | Image pull policy |
| image.repository | string | `"registry.k8s.io/kube-state-metrics/kube-state-metrics"` | The image repository to pull from |
| image.tag | string | `nil` | The image tag to pull - default is version from Chart.yaml |
| imagePullSecrets | list | `[]` |  |
| kubeTargetVersionOverride | string | `""` | Provide a k8s version to define apiGroups for podSecurityPolicy Cluster Role. For example: kubeTargetVersionOverride: 1.14.9 |
| kubeconfig.enabled | bool | `false` |  |
| kubeconfig.secret | string | `nil` | base64 encoded kube-config file |
| namespaceOverride | string | `""` | Override the deployment namespace @default will be set to `.Release.Namespace` if it is not set |
| nodeSelector | object | `{}` | Node labels for pod assignment Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| podAnnotations | object | `{}` | Annotations to be added to the pod |
| podDisruptionBudget | object | `{}` | Optional PodDisruptionBudget Ref: https://kubernetes.io/docs/tasks/run-application/configure-pdb/ |
| podSecurityContext.fsGroup | int | `65534` | Group ID for the filesystem |
| podSecurityContext.runAsGroup | int | `65534` | Group ID for the container |
| podSecurityContext.runAsUser | int | `65534` | User ID for the container |
| podSecurityPolicy.additionalVolumes | list | `[]` | Specify allowed volumes in the pod security policy (`secret` is always allowed) |
| podSecurityPolicy.annotations | object | `{}` | Specify pod annotations in the pod security policy Ref: https://kubernetes.io/docs/concepts/policy/pod-security-policy/#apparmor Ref: https://kubernetes.io/docs/concepts/policy/pod-security-policy/#seccomp Ref: https://kubernetes.io/docs/concepts/policy/pod-security-policy/#sysctl |
| podSecurityPolicy.enabled | bool | `false` | If true, create & use PodSecurityPolicy resources. Note that related RBACs are created only if `rbac.enabled` is `true`. |
| priorityClassName | string | `"secure-cloud-stack-technical-operations-critical"` | Name of Priority Class to assign pods |
| prometheus.monitor.additionalLabels | object | `{}` | Additional labels that can be used so ServiceMonitor will be discovered by Prometheus |
| prometheus.monitor.enabled | bool | `false` | Set this to true to create ServiceMonitor for Prometheus operator |
| prometheus.monitor.honorLabels | bool | `false` | Honor metric labels |
| prometheus.monitor.namespace | string | `""` | Namespace where servicemonitor resource should be created |
| prometheusScrape | bool | `true` | Whether or not enable prom scrape |
| rbac.create | bool | `true` |  |
| replicas | int | `1` | Number of replicas |
| resources | object | `{"limits":{"memory":"100Mi"},"requests":{"cpu":"50m","memory":"64Mi"}}` | kube-state-metrics resource requests and limits |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| service.annotations | object | `{}` | Annotations to be added to the service. |
| service.loadBalancerIP | string | `""` |  |
| service.nodePort | int | `0` |  |
| service.port | int | `8080` | The port of the container |
| service.type | string | `"ClusterIP"` | Service type. Default to clusterIP for backward compatibility. |
| serviceAccount.annotations | object | `{}` | ServiceAccount annotations. Use case: AWS EKS IAM roles for service accounts ref: https://docs.aws.amazon.com/eks/latest/userguide/specify-service-account-role.html |
| serviceAccount.create | bool | `true` | If true, create & use serviceAccount. Require rbac true |
| serviceAccount.imagePullSecrets | list | `[]` | Reference to one or more secrets to be used when pulling images ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| serviceAccount.name | string | `nil` | The name of the ServiceAccount to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Tolerations for pod assignment Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
