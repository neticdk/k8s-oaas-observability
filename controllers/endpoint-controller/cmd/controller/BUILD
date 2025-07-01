load("@rules_go//go:def.bzl", "go_binary", "go_library")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_push")
load("@rules_pkg//pkg:pkg.bzl", "pkg_tar")

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
        "@io_k8s_klog_v2//:go_default_library",
    ],
)

go_binary(
    name = "controller",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)

pkg_tar(
    name = "controller_layer",
    srcs = [":controller"],
)

oci_image(
    name = "controller_image",
    base = "@distroless_base",
    entrypoint = ["/controller"],
    tars = [":controller_layer"],
)

oci_push(
    name = "push",
    image = ":controller_image",
    repository = "ghcr.io/neticdk/endpoint-controller",
)
