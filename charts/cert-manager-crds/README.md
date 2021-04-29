# cert-manager-crds

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.3.1](https://img.shields.io/badge/AppVersion-1.3.1-informational?style=flat-square)

Install the CRDs needed by cert-manager. This chart is used by the
otel-operator chart. Helm does not handle installing templated CRDs
before the resources using the CRDs and so we need to put them in a separate
crds directory.

**Homepage:** <https://cert-manager.io/docs/installation/kubernetes/>

## Updating the CRDs

Run:

```
bin/get-crds.sh 1.3.1
```

This will fetch the manifests for version 1.3.1 and place them in
`crds/cert-manager.crds.yaml`.

## Source Code

* <https://github.com/jetstack/cert-manager>

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
