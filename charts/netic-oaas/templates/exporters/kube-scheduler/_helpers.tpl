{{/*
Create a fully qualified kube-scheduler name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "kube-scheduler.fullname" -}}
{{- if .Values.kubeScheduler.fullnameOverride -}}
{{- .Values.kubeScheduler.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "kube-scheduler" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "kube-scheduler" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
kube-scheduler common labels
*/}}
{{- define "kube-scheduler.labels" -}}
{{ include "kube-scheduler.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
kube-scheduler selector labels
*/}}
{{- define "kube-scheduler.matchLabels" -}}
app.kubernetes.io/component: kube-scheduler
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}
