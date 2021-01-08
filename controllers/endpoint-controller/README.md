# Endpoint Controller

Kuberntes controller to expose ednpoints based on watching the cluster topology. E.g., it is
capable of exposing components of the control plane running outside of the cluster such as
kube-scheduler, kube-controller-manager, adn etcd.

## Development

Bazel build files can be generated with (Gazelle)[https://github.com/bazelbuild/bazel-gazelle]

```bash
$ bazel run //:gazelle
```

Bazel dependencies can be updated from `go.mod` using:

```bash
$ bazel run //:gazelle -- update-repos -from_file=go.mod -to_macro=deps.bzl%go_dependencies -build_file_proto_mode=disable_global
```

Creating local Docker image:

```bash
$ bazel run --platforms=@io_bazel_rules_go//go/toolchain:linux_amd64 //cmd/controller:docker_image
```

Testing
````bash
$ bazel test //...
````

Cleaning
````bash
$ bazel clean
````


## References

- https://github.com/prometheus-operator/prometheus-operator/blob/434f9f7e0b75cd1bcb444cf4532a53112074af4e/pkg/prometheus/operator.go#L557
- https://github.com/rancher/system-charts/tree/dev-v2.4/charts/rancher-monitoring
- https://github.com/rancher/rancher/blob/master/pkg/controllers/managementagent/monitoring/clusterHandler.go#L240
- https://github.com/kubernetes/community/blob/8cafef897a22026d42f5e5bb3f104febe7e29830/contributors/devel/controllers.md
- https://github.com/kubernetes/community/blob/master/contributors/devel/sig-api-machinery/controllers.md