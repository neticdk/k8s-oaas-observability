{{/*
promxy fullname
*/}}
{{- define "aoi.promxyFullname" -}}
{{ include "aoi.name" . }}-promxy
{{- end }}

{{/*
promxy common labels
*/}}
{{- define "aoi.promxyLabels" -}}
{{ include "aoi.labels" . }}
app.kubernetes.io/component: promxy
{{- end }}

{{/*
promxy selector labels
*/}}
{{- define "aoi.promxySelectorLabels" -}}
{{ include "aoi.selectorLabels" . }}
app.kubernetes.io/component: promxy
{{- end }}

{{/*
promxy priority class name
*/}}
{{- define "aoi.promxyPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.promxy.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}
