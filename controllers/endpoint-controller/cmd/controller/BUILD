load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")
load("@io_bazel_rules_docker//container:container.bzl", "container_image", "container_push")

go_library(
    name = "go_default_library",
    srcs = ["main.go"],
    importpath = "netic.dk/endpoint-controller/cmd/controller",
    visibility = ["//visibility:private"],
    deps = [
        "//pkg/controller:go_default_library",
        "//pkg/signals:go_default_library",
        "@io_k8s_client_go//informers:go_default_library",
        "@io_k8s_client_go//kubernetes:go_default_library",
        "@io_k8s_client_go//tools/clientcmd:go_default_library",
        "@io_k8s_klog//:go_default_library",
    ],
)

go_binary(
    name = "controller",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)

container_image(
    name = "docker_image",
    base = "@alpine_linux_amd64//image",
    entrypoint = ["/controller"],
    files = [":controller"],
    user = "65534",
)

container_push(
    name = "publish",
    format = "Docker",
    image = ":docker_image",
    registry = "ghcr.io",
    repository = "neticdk/endpoint-controller",
    tag = "$(version)",
)
