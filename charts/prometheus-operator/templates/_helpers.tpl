{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "fullname" -}}
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
{{- define "chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "labels" -}}
helm.sh/chart: {{ include "chart" . }}
{{ include "matchLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "matchLabels" -}}
app.kubernetes.io/name: {{ include "name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "prometheus-operator.serviceAccountName" -}}
{{- if .Values.prometheusOperator.serviceAccount.create -}}
{{ default (include "fullname" .) .Values.prometheusOperator.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.prometheusOperator.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Resolve the actual image tag to use.
*/}}
{{- define "imageTag" -}}
{{- if .Values.prometheusOperator.image.tag }}
{{- .Values.prometheusOperator.image.tag }}
{{- else }}
{{- printf "v%s" .Chart.AppVersion }}
{{- end }}
{{- end }}

{{/*
Resolve the actual image tag to use for config map reloader.
*/}}
{{- define "prometheusConfigReloaderImage.imageTag" -}}
{{- if .Values.prometheusOperator.prometheusConfigReloaderImage.tag }}
{{- .Values.prometheusOperator.prometheusConfigReloaderImage.tag }}
{{- else }}
{{- printf "v%s" .Chart.AppVersion }}
{{- end }}
{{- end }}
