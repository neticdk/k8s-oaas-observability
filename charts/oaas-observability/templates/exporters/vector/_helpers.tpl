{{/*
Create a fully qualified vector name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "netic-oaas.vector.fullname" -}}
{{- if index .Values "vector-agent" "fullnameOverride" -}}
{{- index .Values "vector-agent" "fullnameOverride" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "vector" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "vector" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
vector common labels
*/}}
{{- define "netic-oaas.vector.labels" -}}
{{ include "netic-oaas.vector.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
vector selector labels
*/}}
{{- define "netic-oaas.vector.matchLabels" -}}
app.kubernetes.io/component: vector
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}
