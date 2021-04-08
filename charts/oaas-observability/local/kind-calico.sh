#!/bin/bash

DIR=$(dirname $0)

kind create cluster --name oaas-calico --config $DIR/kind-calico-cluster.yaml
kubectl apply -f https://docs.projectcalico.org/v3.16/manifests/calico.yaml
kubectl rollout status -n kube-system deployment calico-kube-controllers
cat <<EOF | kubectl apply -n netic-oaas-system -f -
---
apiVersion: v1
kind: Namespace
metadata:
  name: netic-oaas-system
  labels:
    name: netic-oaas-system
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-all
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
EOF
