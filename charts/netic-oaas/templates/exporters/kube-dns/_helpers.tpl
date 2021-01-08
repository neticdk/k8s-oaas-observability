{{/*
Create a fully qualified kube-dns name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "kube-dns.fullname" -}}
{{- if .Values.kubeDns.fullnameOverride -}}
{{- .Values.kubeDns.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "kube-dns" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "kube-dns" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
kube-dns common labels
*/}}
{{- define "kube-dns.labels" -}}
{{ include "kube-dns.matchLabels" . }}
{{ include "netic-oaas.metaLabels" . }}
{{- end -}}

{{/*
kube-dns selector labels
*/}}
{{- define "kube-dns.matchLabels" -}}
app.kubernetes.io/component: kube-dns
{{ include "netic-oaas.matchLabels" . }}
{{- end -}}
