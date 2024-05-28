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
Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "promtail-forwarding.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{- define "opentelemetry-collector.configName" -}}
{{ include "promtail-forwarding.opentelemetry-configname" . }}
{{- end }}
