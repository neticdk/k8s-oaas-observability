load("@rules_go//go:def.bzl", "go_library", "go_test")

go_library(
    name = "go_default_library",
    srcs = ["controller.go"],
    importpath = "netic.dk/endpoint-controller/pkg/controller",
    visibility = ["//visibility:public"],
    deps = [
        "@com_github_pkg_errors//:go_default_library",
        "@io_k8s_api//core/v1:go_default_library",
        "@io_k8s_apimachinery//pkg/api/errors:go_default_library",
        "@io_k8s_apimachinery//pkg/apis/meta/v1:go_default_library",
        "@io_k8s_apimachinery//pkg/util/runtime:go_default_library",
        "@io_k8s_apimachinery//pkg/util/wait:go_default_library",
        "@io_k8s_client_go//informers/core/v1:go_default_library",
        "@io_k8s_client_go//kubernetes:go_default_library",
        "@io_k8s_client_go//listers/core/v1:go_default_library",
        "@io_k8s_client_go//tools/cache:go_default_library",
        "@io_k8s_client_go//util/workqueue:go_default_library",
        "@io_k8s_klog_v2//:go_default_library",
    ],
)

go_test(
    name = "go_default_test",
    srcs = ["controller_test.go"],
    embed = [":go_default_library"],
    deps = [
        "@com_github_stretchr_testify//assert:go_default_library",
        "@io_k8s_api//core/v1:go_default_library",
        "@io_k8s_apimachinery//pkg/apis/meta/v1:go_default_library",
        "@io_k8s_apimachinery//pkg/runtime:go_default_library",
        "@io_k8s_client_go//informers:go_default_library",
        "@io_k8s_client_go//kubernetes/fake:go_default_library",
        "@io_k8s_client_go//testing:go_default_library",
    ],
)
