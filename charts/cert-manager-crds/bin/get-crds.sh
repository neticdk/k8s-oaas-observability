#!/bin/sh

if [ -z $1 ]; then
  echo "Need a version argument in the form x.y.z"
  exit 1
fi

curl -L -o crds/cert-manager.crds.yaml https://github.com/jetstack/cert-manager/releases/download/v$1/cert-manager.yaml
