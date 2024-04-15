{{/*
Create the git config for bootstrapConfig.
*/}}
{{- define "aoi.dashboards.bootstrapConfig" -}}
git:
{{- if eq .Values.global.bootstrapConfig.git.flavor "github" }}
  github:
  {{- default .Values.global.bootstrapConfig.git.github .Values.dashboards.bootstrapConfig.git.github | toYaml | nindent 4}}
{{- else if eq .Values.global.bootstrapConfig.git.flavor "gitlab" }}
  gitlab:
  {{- default .Values.global.bootstrapConfig.git.gitlab .Values.dashboards.bootstrapConfig.git.gitlab | toYaml | nindent 4}}
{{- else if eq .Values.global.bootstrapConfig.git.flavor "bitbucket" }}
  bitbucket:
  {{- default .Values.global.bootstrapConfig.git.bitbucket .Values.dashboards.bootstrapConfig.git.bitbucket | toYaml | nindent 4}}
{{- else }}
{{ fail "Invalid git flavor. Supported git flavors (github,gitlab,bitbucket)" }}
{{- end }}
vault:
{{- default .Values.global.bootstrapConfig.vault .Values.dashboards.bootstrapConfig.vault | toYaml | nindent 2}}
externalSecretsStore:
{{- default .Values.global.bootstrapConfig.externalSecretsStore .Values.dashboards.bootstrapConfig.externalSecretsStore | toYaml | nindent 2}}
{{- end }}
