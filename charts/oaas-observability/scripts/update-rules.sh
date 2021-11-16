#!/bin/bash

#
# Script to update the Helm templates for recording and alerting rules based on the jsonnet mixins
#

# Requires:
# - jsonnet
# - jb

DIR="$(dirname $0)"

pushd $DIR

jb install
mkdir -p ../files/dashboards/etcd-mixin
mkdir -p ../files/dashboards/k8s-mixin
mkdir -p ../files/dashboards/k8s-windows-mixin

# Handle Kubernetes recording rules
echo Generating Kubernetes recording rules
jsonnet -J vendor -S recording-rules.jsonnet -o ../files/rules.yaml

# Handle Kubernetes alerting rules
echo Generating Kubernetes alerting rules
jsonnet -J vendor -S alerts-k8s.jsonnet -o ../files/alerts-k8s.yaml

# Handle etcd alerting rules
echo Generating etcd alerting rules
jsonnet -J vendor -S alerts-etcd.jsonnet -o ../files/alerts-etcd.yaml

echo Generating Kubernetes Grafana dashboards
jsonnet -J vendor -m ../files/dashboards/k8s-mixin grafana-k8s.jsonnet

echo Generating etcd Grafana dashboards
jsonnet -J vendor -m ../files/dashboards/etcd-mixin grafana-etcd.jsonnet

# Handle windows specific stuff
echo Generating Kubernetes Windows recording rules
jsonnet -J vendor -S windows-recording-rules.jsonnet -o ../files/windows-rules.yaml

echo Generating Kubernetes Windows Grafana dashboards
jsonnet -J vendor -m ../files/dashboards/k8s-windows-mixin grafana-k8s-windows.jsonnet

popd
