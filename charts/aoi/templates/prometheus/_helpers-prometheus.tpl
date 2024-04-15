{{/*
prometheus fullname
*/}}
{{- define "aoi.prometheusFullname" -}}
{{ include "aoi.name" . }}-prometheus
{{- end }}

{{/*
prometheus common labels
*/}}
{{- define "aoi.prometheusLabels" -}}
{{ include "aoi.labels" . }}
app.kubernetes.io/component: prometheus
{{- end }}

{{/*
prometheus selector labels
*/}}
{{- define "aoi.prometheusSelectorLabels" -}}
{{ include "aoi.selectorLabels" . }}
app.kubernetes.io/component: prometheus
{{- end }}

{{/*
prometheus priority class name
*/}}
{{- define "aoi.prometheusPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.prometheus.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}


{{/*
Create remotewrite url for tsdb.
*/}}
{{- define "aoi.prometheusWriteUrl" -}}
{{- if .Values.global.tsdb.high_availability.enabled }}
{{- printf "http://%s-victoria-metrics-single-1-server:8428/api/v1/write,http://%s-victoria-metrics-single-2-server:8428/api/v1/write" (include "aoi.name" . ) (include "aoi.name" . ) }}
{{- else }}
{{- printf "http://%s-victoria-metrics-single-1-server:8428/api/v1/write" (include "aoi.name" . ) }}
{{- end }}
{{- end }}

{{/*
Create remotewrite.MaxDiskUsagePerURL for vmagent.
*/}}
{{- define "aoi.prometheusMaxDiskUsagePerURL" -}}
{{- $diskSize := trimSuffix "Gi" .Values.prometheus.persistence.size | int64 }}
{{- if .Values.global.tsdb.high_availability.enabled }}
{{- $ModifiedDiskSize := div  (sub $diskSize 10) 2 | toString}}
{{- printf "%sGB,%sGB" $ModifiedDiskSize $ModifiedDiskSize }}
{{- else }}
{{- $ModifiedDiskSize := sub $diskSize 10 | toString}}
{{- printf "%sGB" $ModifiedDiskSize }}
{{- end }}
{{- end }}
