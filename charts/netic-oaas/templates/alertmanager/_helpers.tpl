{{/*
Create a fully qualified alertmanager name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "alertmanager.fullname" -}}
{{- if .Values.alertmanager.fullnameOverride -}}
{{- .Values.alertmanager.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "alertmanager" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "alertmanager" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
alertmanager common labels
*/}}
{{- define "alertmanager.labels" -}}
{{ include "alertmanager.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
alertmanager selector labels
*/}}
{{- define "alertmanager.matchLabels" -}}
app.kubernetes.io/component: alertmanager
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "alertmanager.serviceAccountName" -}}
{{- if .Values.alertmanager.serviceAccount.create -}}
{{ default (include "alertmanager.fullname" .) .Values.alertmanager.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.alertmanager.serviceAccount.name }}
{{- end -}}
{{- end -}}
