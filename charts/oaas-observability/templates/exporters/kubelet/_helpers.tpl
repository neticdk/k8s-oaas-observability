{{/*
Create a fully qualified kubelet name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "kubelet.fullname" -}}
{{- if .Values.kubelet.fullnameOverride -}}
{{- .Values.kubelet.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "kubelet" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "kubelet" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
kubelet common labels
*/}}
{{- define "kubelet.labels" -}}
{{ include "kubelet.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
kubelet selector labels
*/}}
{{- define "kubelet.matchLabels" -}}
app.kubernetes.io/component: kubelet
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}
