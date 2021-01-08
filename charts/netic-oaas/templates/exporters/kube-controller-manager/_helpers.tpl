{{/*
Create a fully qualified kube-controller-manager name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "kube-controller-manager.fullname" -}}
{{- if .Values.kubeControllerManager.fullnameOverride -}}
{{- .Values.kubeControllerManager.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "kube-controller-manager" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "kube-controller-manager" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
kube-controller-manager common labels
*/}}
{{- define "kube-controller-manager.labels" -}}
{{ include "kube-controller-manager.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
kube-controller-manager selector labels
*/}}
{{- define "kube-controller-manager.matchLabels" -}}
app.kubernetes.io/component: kube-controller-manager
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}
