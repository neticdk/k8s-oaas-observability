load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "go_default_library",
    srcs = [
        "signal.go",
        "signal_posix.go",
        "signal_windows.go",
    ],
    importpath = "netic.dk/endpoint-controller/pkg/signals",
    visibility = ["//visibility:public"],
)
