# kube-state-metrics

![Version: 1.0.2](https://img.shields.io/badge/Version-1.0.2-informational?style=flat-square) ![AppVersion: 1.9.7](https://img.shields.io/badge/AppVersion-1.9.7-informational?style=flat-square)

Install kube-state-metrics to generate and expose cluster-level metrics

**Homepage:** <https://github.com/kubernetes/kube-state-metrics>

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add netic-oaas http://neticdk.github.io/k8s-oaas-observability
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
| collectors.certificatesigningrequests | bool | `true` | Enable the certificatesigningrequests collector. |
| collectors.configmaps | bool | `true` | Enable the configmaps collector. |
| collectors.cronjobs | bool | `true` | Enable the cronjobs collector. |
| collectors.daemonsets | bool | `true` | Enable the daemonsets collector. |
| collectors.deployments | bool | `true` | Enable the deployments collector. |
| collectors.endpoints | bool | `true` | Enable the endpoints collector. |
| collectors.horizontalpodautoscalers | bool | `true` | Enable the horizontalpodautoscalers collector. |
| collectors.ingresses | bool | `true` | Enable the ingresses collector. |
| collectors.jobs | bool | `true` | Enable the jobs collector. |
| collectors.limitranges | bool | `true` | Enable the limitranges collector. |
| collectors.mutatingwebhookconfigurations | bool | `true` | Enable the mutatingwebhookconfigurations collector. |
| collectors.namespaces | bool | `true` | Enable the namespaces collector. |
| collectors.networkpolicies | bool | `true` | Enable the networkpolicies collector. |
| collectors.nodes | bool | `true` | Enable the nodes collector. |
| collectors.persistentvolumeclaims | bool | `true` | Enable the persistentvolumeclaims collector. |
| collectors.persistentvolumes | bool | `true` | Enable the persistentvolumes collector. |
| collectors.poddisruptionbudgets | bool | `true` | Enable the poddisruptionbudgets collector. |
| collectors.pods | bool | `true` | Enable the pods collector. |
| collectors.replicasets | bool | `true` | Enable the replicasets collector. |
| collectors.replicationcontrollers | bool | `true` | Enable the replicationcontrollers collector. |
| collectors.resourcequotas | bool | `true` | Enable the resourcequotas collector. |
| collectors.secrets | bool | `true` | Enable the secrets collector. |
| collectors.services | bool | `true` | Enable the services collector. |
| collectors.statefulsets | bool | `true` | Enable the statefulsets collector. |
| collectors.storageclasses | bool | `true` | Enable the storageclasses collector. |
| collectors.validatingwebhookconfigurations | bool | `true` | Enable the validatingwebhookconfigurations collector. |
| collectors.verticalpodautoscalers | bool | `false` | Enable the verticalpodautoscalers collector. |
| collectors.volumeattachments | bool | `true` | Enable the volumeattachments collector. |
| customLabels | object | `{}` | Custom labels to apply to service, deployment and pods |
| global.networkPolicyEnabled | bool | `false` | Deploy network policy allowing ingress. |
| hostNetwork | bool | `false` | Whether or not to use the host network |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"quay.io/coreos/kube-state-metrics"` | The image repository to pull from |
| image.tag | string | `"v1.9.7"` | The image tag to pull |
| imagePullSecrets | list | `[]` |  |
| kubeTargetVersionOverride | string | `""` | Provide a k8s version to define apiGroups for podSecurityPolicy Cluster Role. For example: kubeTargetVersionOverride: 1.14.9 |
| kubeconfig.enabled | bool | `false` |  |
| kubeconfig.secret | string | `nil` | base64 encoded kube-config file |
| namespaceOverride | string | `""` |  |
| nodeSelector | object | `{}` | Node labels for pod assignment Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| podAnnotations | object | `{}` | Annotations to be added to the pod |
| podDisruptionBudget | object | `{}` | Optional PodDisruptionBudget Ref: https://kubernetes.io/docs/tasks/run-application/configure-pdb/ |
| podSecurityPolicy.additionalVolumes | list | `[]` | Specify allowed volumes in the pod security policy (`secret` is always allowed) |
| podSecurityPolicy.annotations | object | `{}` | Specify pod annotations in the pod security policy Ref: https://kubernetes.io/docs/concepts/policy/pod-security-policy/#apparmor Ref: https://kubernetes.io/docs/concepts/policy/pod-security-policy/#seccomp Ref: https://kubernetes.io/docs/concepts/policy/pod-security-policy/#sysctl |
| podSecurityPolicy.enabled | bool | `false` | If true, create & use PodSecurityPolicy resources. Note that related RBACs are created only if `rbac.enabled` is `true`. |
| priorityClassName | string | `nil` | Name of Priority Class to assign pods |
| prometheus.monitor.additionalLabels | object | `{}` | Additional labels that can be used so ServiceMonitor will be discovered by Prometheus |
| prometheus.monitor.enabled | bool | `false` | Set this to true to create ServiceMonitor for Prometheus operator |
| prometheus.monitor.honorLabels | bool | `false` | Honor metric labels |
| prometheus.monitor.namespace | string | `""` | Namespace where servicemonitor resource should be created |
| prometheusScrape | bool | `true` | Whether or not enable prom scrape |
| rbac.create | bool | `true` |  |
| replicas | int | `1` | Number of replicas |
| resources | object | `{}` | kube-state-metrics resource requests and limits |
| securityContext.enabled | bool | `true` | Enable security context |
| securityContext.fsGroup | int | `65534` | Group ID for the filesystem |
| securityContext.runAsGroup | int | `65534` | Group ID for the container |
| securityContext.runAsUser | int | `65534` | User ID for the container |
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
