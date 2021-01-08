{{/*
Create a fully qualified kupe-api-server name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "kube-api-server.fullname" -}}
{{- if .Values.kubeApiServer.fullnameOverride -}}
{{- .Values.kubeApiServer.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "apiserver" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "apiserver" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
kube-api-server common labels
*/}}
{{- define "kube-api-server.labels" -}}
{{ include "kube-api-server.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
kube-api-server selector labels
*/}}
{{- define "kube-api-server.matchLabels" -}}
app.kubernetes.io/component: apiserver
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}
