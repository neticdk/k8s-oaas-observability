{{/*
Expand the name of the chart.
*/}}
{{- define "aoi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "aoi.fullname" -}}
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
{{- define "aoi.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "aoi.labels" -}}
helm.sh/chart: {{ include "aoi.chart" . }}
{{ include "aoi.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "aoi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aoi.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "aoi.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "aoi.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the hostname for the read path to tsdb.
*/}}
{{- define "aoi.readHost" -}}
{{- if .Values.global.tsdb.high_availability.enabled }}
{{- printf "promxy" }}
{{- else }}
{{- printf "victoria-metrics-single-1-server" }}
{{- end }}
{{- end }}

{{/*
Create the port for the read path to tsdb.
*/}}
{{- define "aoi.readPort" -}}
{{- if .Values.global.tsdb.high_availability.enabled }}
{{- printf "8082" }}
{{- else }}
{{- printf "8428" }}
{{- end }}
{{- end }}

{{/*
metrics read url 
*/}}
{{- define "aoi.readUrl" -}}
{{- printf "http://%s-%s.%s.svc.%s:%s" (include "aoi.name" . ) (include "aoi.readHost" . ) .Release.Namespace .Values.global.clusterDomain (include "aoi.readPort" . ) }} 
{{- end }}


{{/*
metrics read url for grafana
*/}}
{{- define "aoi.grafanaReadUrl" -}}
{{- if .Values.authProxy.enabled }}
{{- printf "http://%s-auth-proxy.%s.svc.%s:8080" (include "aoi.name" . )   .Release.Namespace .Values.global.clusterDomain }}
{{- else }}
{{- printf "http://%s-%s.%s.svc.%s:%s" (include "aoi.name" . ) (include "aoi.readHost" . ) .Release.Namespace .Values.global.clusterDomain (include "aoi.readPort" . ) }} 
{{- end }}
{{- end }}

{{/*
Create the lable value for victoria-metrics kubernetes/name lable.
*/}}
{{- define "aoi.vmLableName" -}}
{{- if .Values.global.tsdb.high_availability.enabled }}
{{- printf "promxy" }}
{{- else }}
{{- printf "victoria-metrics-single-1" }}
{{- end }}
{{- end }}
