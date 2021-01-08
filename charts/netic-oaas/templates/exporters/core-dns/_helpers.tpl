{{/*
Create a fully qualified core-dns name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "core-dns.fullname" -}}
{{- if .Values.coreDns.fullnameOverride -}}
{{- .Values.coreDns.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "coredns" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "coredns" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
core-dns common labels
*/}}
{{- define "core-dns.labels" -}}
{{ include "core-dns.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
core-dns selector labels
*/}}
{{- define "core-dns.matchLabels" -}}
app.kubernetes.io/component: coredns
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}
