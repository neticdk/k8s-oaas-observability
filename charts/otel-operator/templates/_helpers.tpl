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
{{ include "otel-operator.matchLabels" . }}
{{- if .Values.opentelemetryOperator.podLabels}}
{{ toYaml .Values.opentelemetryOperator.podLabels }}
{{- end }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
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

{{/*
Cert name
*/}}
{{- define "otel-operator.servingCertName" -}}
{{- printf "%s-serving-cert" (include "otel-operator.fullname" .) | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Issuer name
*/}}
{{- define "otel-operator.issuerName" -}}
{{- printf "%s-selfsigned-issuer" (include "otel-operator.fullname" .) | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Controller manager service cert secret name
*/}}
{{- define "otel-operator.servingCertSecretName" -}}
{{- printf "%s-ctrl-mgr-svc-crt" (include "otel-operator.fullname" .) | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Webhook service name
*/}}
{{- define "otel-operator.webhookServiceName" -}}
{{- printf "%s-webhook-svc" (include "otel-operator.fullname" .) | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Controllre manager metrics service name
*/}}
{{- define "otel-operator.controllerManagerMetricsServiceName" -}}
{{- printf "%s-ctrl-mgr-metr-svc" (include "otel-operator.fullname" .) | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
