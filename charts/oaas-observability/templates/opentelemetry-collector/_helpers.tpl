{{/*
Create a fully qualified name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "opentelemetryCollector.fullname" -}}
{{- if .Values.opentelemetryCollector.fullnameOverride -}}
{{- .Values.opentelemetryCollector.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "opentelemetry-collector" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "opentelemetry-collector" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified name.
We truncate at 41 chars because opentelemetryCollector Operator will add prefixes and postfixes.
*/}}
{{- define "opentelemetryCollector.resource-fullname" -}}
{{- if .Values.opentelemetryCollector.fullnameOverride -}}
{{- .Values.opentelemetryCollector.fullnameOverride | trunc 41 | trimSuffix "-" -}}
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
opentelemetryCollector common labels
*/}}
{{- define "opentelemetryCollector.labels" -}}
{{ include "opentelemetryCollector.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
opentelemetryCollector selector labels.
The instance label is created to match that of the opentelemetryCollector Operator (which overrides labels given in opentelemetryCollector CRD)
*/}}
{{- define "opentelemetryCollector.matchLabels" -}}
app.kubernetes.io/component: opentelemetry-collector
app.kubernetes.io/name: opentelemetry-collector
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "opentelemetryCollector.serviceAccountName" -}}
{{- if .Values.opentelemetryCollector.serviceAccount.create -}}
{{ default (include "netic-oaas.fullname" .) .Values.opentelemetryCollector.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.opentelemetryCollector.serviceAccount.name }}
{{- end -}}
{{- end -}}
