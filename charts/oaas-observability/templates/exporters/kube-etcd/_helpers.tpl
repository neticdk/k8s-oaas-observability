{{/*
Create a fully qualified kube-etcd name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "kube-etcd.fullname" -}}
{{- if .Values.kubeEtcd.fullnameOverride -}}
{{- .Values.kubeEtcd.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "kube-etcd" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "kube-etcd" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
kube-etcd common labels
*/}}
{{- define "kube-etcd.labels" -}}
{{ include "kube-etcd.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
kube-etcd selector labels
*/}}
{{- define "kube-etcd.matchLabels" -}}
app.kubernetes.io/component: kube-etcd
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}
