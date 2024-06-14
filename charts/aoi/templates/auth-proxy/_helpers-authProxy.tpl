{{/*
authProxy fullname
*/}}
{{- define "aoi.authProxyFullname" -}}
{{ include "aoi.name" . }}-auth-proxy
{{- end }}

{{/*
authProxy common labels
*/}}
{{- define "aoi.authProxyLabels" -}}
{{ include "aoi.labels" . }}
app.kubernetes.io/component: auth-proxy
{{- end }}

{{/*
authProxy selector labels
*/}}
{{- define "aoi.authProxySelectorLabels" -}}
{{ include "aoi.selectorLabels" . }}
app.kubernetes.io/component: auth-proxy
{{- end }}

{{/*
authProxy priority class name
*/}}
{{- define "aoi.authProxyPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.authProxy.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}

{{/*
authProxy upstreamUrl
*/}}
{{- define "aoi.upstreamUrl" -}}
{{- printf "http://%s-%s.%s.svc.%s:%s" (include "aoi.name" . ) (include "aoi.readHost" . ) .Release.Namespace .Values.global.clusterDomain (include "aoi.readPort" . ) }}
{{- end }}
