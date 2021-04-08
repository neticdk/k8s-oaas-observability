{{/*
Create a fully qualified name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "prometheus.fullname" -}}
{{- if .Values.prometheus.fullnameOverride -}}
{{- .Values.prometheus.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "prometheus" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "prometheus" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified name.
We truncate at 41 chars because Prometheus Operator will add prefixes and postfixes.
*/}}
{{- define "prometheus.resource-fullname" -}}
{{- if .Values.prometheus.fullnameOverride -}}
{{- .Values.prometheus.fullnameOverride | trunc 41 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 41 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 41 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Prometheus common labels
*/}}
{{- define "prometheus.labels" -}}
{{ include "prometheus.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
Prometheus selector labels
*/}}
{{- define "prometheus.matchLabels" -}}
app.kubernetes.io/component: prometheus
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "prometheus.serviceAccountName" -}}
{{- if .Values.prometheus.serviceAccount.create -}}
{{ default (include "netic-oaas.fullname" .) .Values.prometheus.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.prometheus.serviceAccount.name }}
{{- end -}}
{{- end -}}
