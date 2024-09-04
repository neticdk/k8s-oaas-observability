{{/*
list of namespaces that should have alerting enabled
*/}}
{{- define "aoi.alerting.namespaces" -}}
  {{ $newList := list }}
    {{- if .Values.alerting.clusterWideNamespace.enabled }}
      {{ $newList = prepend .Values.alerting.namespaces .Values.alerting.clusterWideNamespace.name }}
    {{- else }}
      {{ $newList = .Values.alerting.namespaces }}
    {{- end }}
  {{ toJson $newList }}
{{- end }}

{{/*
HelmRepository for victoria-metrics-alert
*/}}
{{- define "aoi.alerting.helmRepository" -}}
  {{- range $i, $dep := .Chart.Dependencies }}
    {{- if eq $dep.Name "victoria-metrics-alert" }}
      {{- default $dep.Repository $.Values.alerting.helmRepository }}
    {{- end }}
  {{- end }}
{{- end }}

{{/*
HelmRepository type
*/}}
{{- define "aoi.alerting.helmRepository.type" -}}
  {{- if hasPrefix "oci" ( include "aoi.alerting.helmRepository" . ) }}
    {{- print "oci" -}}
  {{- else }}
    {{- print "default" -}}
  {{- end }}  
{{- end }}

{{/*
Helm chart version for victoria-metrics-alert
*/}}
{{- define "aoi.alerting.chartVersion" -}}
  {{- range $i, $dep := .Chart.Dependencies }}
    {{- if eq $dep.Name "victoria-metrics-alert" }}
      {{-  $dep.Version }}
    {{- end }}
  {{- end }}
{{- end }}

{{/*
promxy priority class name
*/}}
{{- define "aoi.serverPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.alerting.helmRelease.values.server.priorityClassName -}}
{{- if $pcn -}}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}

{{/*
promxy priority class name
*/}}
{{- define "aoi.alertmanagerPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.alerting.helmRelease.values.alertmanager.priorityClassName -}}
{{- if $pcn -}}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}

{{/*
Create the git config for bootstrapConfig.
*/}}
{{- define "aoi.alerting.bootstrapConfig" -}}
git:
{{- if eq .Values.global.bootstrapConfig.git.flavor "github" }}  
  github:
  {{- default .Values.global.bootstrapConfig.git.github .Values.alerting.clusterWideNamespace.bootstrapConfig.git.github | toYaml | nindent 4}}
{{- else if eq .Values.global.bootstrapConfig.git.flavor "gitlab" }}
  gitlab:
  {{- default .Values.global.bootstrapConfig.git.gitlab .Values.alerting.clusterWideNamespace.bootstrapConfig.git.gitlab | toYaml | nindent 4}}
{{- else if eq .Values.global.bootstrapConfig.git.flavor "bitbucket" }}
  bitbucket:
  {{- default .Values.global.bootstrapConfig.git.bitbucket .Values.alerting.clusterWideNamespace.bootstrapConfig.git.bitbucket | toYaml | nindent 4}}
{{- else }}
{{ fail "Invalid git flavor. Supported git flavors (github,gitlab,bitbucket)" }}
{{- end }}
vault:
{{- default .Values.global.bootstrapConfig.vault .Values.alerting.clusterWideNamespace.bootstrapConfig.vault | toYaml | nindent 2}}
externalSecretsStore:
{{- default .Values.global.bootstrapConfig.externalSecretsStore .Values.alerting.clusterWideNamespace.bootstrapConfig.externalSecretsStore | toYaml | nindent 2}}
{{- end }}
