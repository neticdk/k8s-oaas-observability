{{/*
Create a fully qualified endpoint-controller name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "endpoint-controller.fullname" -}}
{{- if .Values.endpointController.fullnameOverride -}}
{{- .Values.endpointController.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "endpoint-controller" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "endpoint-controller" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
endpoint-controller common labels
*/}}
{{- define "endpoint-controller.labels" -}}
{{ include "endpoint-controller.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
endpoint-controller selector labels
*/}}
{{- define "endpoint-controller.matchLabels" -}}
app.kubernetes.io/component: endpoint-controller
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}
