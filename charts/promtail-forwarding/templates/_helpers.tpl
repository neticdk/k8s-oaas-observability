{{- define "promtail-forwarding.promtail-configname" -}}
{{- if contains "promtail" .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name "promtail" | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}

{{- define "promtail-forwarding.opentelemetry-configname" -}}
{{- if contains "opentelemetry-collector" .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name "opentelemetry-collector" | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}

{{- define "promtail-forwarding.opentelemetry-servicename" -}}
{{- if contains "opentelemetry-collector" .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name "opentelemetry-collector" | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}


{{/*
Expand the name of the chart.
*/}}
{{- define "promtail-forwarding.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "promtail-forwarding.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "promtail-forwarding.fullname" -}}
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
Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "promtail-forwarding.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/*
Redefine template from included chart
*/}}
{{- define "opentelemetry-collector.configName" -}}
{{ include "promtail-forwarding.opentelemetry-configname" . }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "promtail-forwarding.labels" -}}
helm.sh/chart: {{ include "promtail-forwarding.chart" . }}
{{ include "promtail-forwarding.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "promtail-forwarding.selectorLabels" -}}
app.kubernetes.io/name: {{ include "promtail-forwarding.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
