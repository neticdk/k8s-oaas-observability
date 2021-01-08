{{/*
Create a fully qualified kube-proxy name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "kube-proxy.fullname" -}}
{{- if .Values.kubeProxy.fullnameOverride -}}
{{- .Values.kubeProxy.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "kube-proxy" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "kube-proxy" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
kube-proxy common labels
*/}}
{{- define "kube-proxy.labels" -}}
{{ include "kube-proxy.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
kube-proxy selector labels
*/}}
{{- define "kube-proxy.matchLabels" -}}
app.kubernetes.io/component: kube-proxy
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}
