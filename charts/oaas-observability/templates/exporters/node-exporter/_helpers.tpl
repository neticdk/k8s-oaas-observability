{{/*
Create a fully qualified node-exporter name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "node-exporter.fullname" -}}
{{- if .Values.nodeExporter.fullnameOverride -}}
{{- .Values.nodeExporter.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "node-exporter" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "node-exporter" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
node-exporter common labels
*/}}
{{- define "node-exporter.labels" -}}
{{ include "node-exporter.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
node-exporter selector labels
*/}}
{{- define "node-exporter.matchLabels" -}}
app.kubernetes.io/component: node-exporter
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}
