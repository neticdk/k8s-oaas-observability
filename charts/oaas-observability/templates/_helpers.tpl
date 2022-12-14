{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "netic-oaas.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "netic-oaas.fullname" -}}
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
{{- define "netic-oaas.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "netic-oaas.labels" -}}
{{ include "netic-oaas.metaLabels" . }}
{{ include "netic-oaas.matchLabels" . }}
{{- end }}

{{/*
Meta labels
*/}}
{{- define "netic-oaas.metaLabels" -}}
helm.sh/chart: {{ include "netic-oaas.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "netic-oaas.matchLabels" -}}
app.kubernetes.io/name: {{ include "netic-oaas.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Allow KubeVersion to be overridden.
*/}}
{{- define "netic-oaas.kubeVersion" -}}
  {{- default .Capabilities.KubeVersion.Version .Values.kubeVersionOverride -}}
{{- end -}}

{{/*
Get Ingress API Version
*/}}
{{- define "netic-oaas.ingress.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" (include "netic-oaas.kubeVersion" .)) -}}
      {{- print "networking.k8s.io/v1" -}}
  {{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" -}}
    {{- print "networking.k8s.io/v1beta1" -}}
  {{- else -}}
    {{- print "extensions/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{/*
Check Ingress stability
*/}}
{{- define "netic-oaas.ingress.isStable" -}}
  {{- eq (include "netic-oaas.ingress.apiVersion" .) "networking.k8s.io/v1" -}}
{{- end -}}

{{/*
Check Ingress supports pathType
pathType was added to networking.k8s.io/v1beta1 in Kubernetes 1.18
*/}}
{{- define "netic-oaas.ingress.supportsPathType" -}}
  {{- or (eq (include "netic-oaas.ingress.isStable" .) "true") (and (eq (include "netic-oaas.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" (include "netic-oaas.kubeVersion" .))) -}}
{{- end -}}

{{/*
Get Policy API Version
*/}}
{{- define "netic-oaas.pdb.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "policy/v1") (semverCompare ">= 1.21-0" (include "netic-oaas.kubeVersion" .)) -}}
      {{- print "policy/v1" -}}
  {{- else -}}
    {{- print "policy/v1beta1" -}}
  {{- end -}}
{{- end -}}
