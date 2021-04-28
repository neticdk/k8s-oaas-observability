{{/*
Expand the name of the chart.
*/}}
{{- define "otel-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "otel-operator.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "otel-operator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "otel-operator.labels" -}}
helm.sh/chart: {{ include "otel-operator.chart" . }}
{{ include "otel-operator.selectorLabels" . }}
{{- if .Values.opentelemetryOperator.podLabels}}
{{ toYaml .Values.opentelemetryOperator.podLabels }}
{{- end }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "otel-operator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "otel-operator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Match labels
*/}}
{{- define "otel-operator.matchLabels" -}}
app.kubernetes.io/name: {{ template "otel-operator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "otel-operator.serviceAccountName" -}}
{{- if .Values.opentelemetryOperator.serviceAccount.create }}
{{- default (include "otel-operator.fullname" .) .Values.opentelemetryOperator.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.opentelemetryOperator.serviceAccount.name }}
{{- end }}
{{- end }}
