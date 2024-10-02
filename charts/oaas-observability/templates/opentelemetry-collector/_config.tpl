{{- define "opentelemetryCollector.baseConfig" -}}
{{- .Values.opentelemetryCollector.config | toYaml }}
{{- end }}

{{/*
Build config file for deployment OpenTelemetry Collector
*/}}
{{- define "opentelemetryCollector.genconfig" -}}
{{- $values := deepCopy .Values.opentelemetryCollector }}
{{- $data := dict "Values" $values | mustMergeOverwrite (deepCopy .) }}
{{- $config := include "opentelemetryCollector.baseConfig" $data | fromYaml }}
{{- if .Values.opentelemetryCollector.presets.kubernetesAttributes.enabled }}
{{- $config = (include "opentelemetryCollector.applyKubernetesAttributesConfig" (dict "Values" $data "config" $config) | fromYaml) }}
{{- end }}
{{- if .Values.opentelemetryCollector.presets.kubernetesEvents.enabled }}
{{- $config = (include "opentelemetryCollector.applyKubernetesEventsConfig" (dict "Values" $data "config" $config) | fromYaml) }}
{{- end }}
{{- tpl (toYaml $config) . }}
{{- end }}

{{- define "opentelemetryCollector.applyKubernetesAttributesConfig" -}}
{{- $config := mustMergeOverwrite (include "opentelemetryCollector.kubernetesAttributesConfig" .Values.opentelemetryCollector | fromYaml) .config }}
{{- if $config.service.pipelines.logs }}
  {{- $config = mustMergeOverwrite (dict "service" (dict "pipelines" (dict "logs" (dict "processors" list)))) $config }}
  {{- if not (has "k8sattributes" $config.service.pipelines.logs.processors) }}
    {{- $_ := set $config.service.pipelines.logs "processors" (prepend $config.service.pipelines.logs.processors "k8sattributes" | uniq)  }}
  {{- end }}
{{- end }}
{{- if and $config.service.pipelines.metrics }}
  {{- $config = mustMergeOverwrite (dict "service" (dict "pipelines" (dict "metrics" (dict "processors" list)))) $config }}
  {{- if not (has "k8sattributes" $config.service.pipelines.metrics.processors) }}
    {{- $_ := set $config.service.pipelines.metrics "processors" (prepend $config.service.pipelines.metrics.processors "k8sattributes" | uniq)  }}
  {{- end }}
{{- end }}
{{- if and $config.service.pipelines.traces }}
  {{- $config = mustMergeOverwrite (dict "service" (dict "pipelines" (dict "traces" (dict "processors" list)))) $config }}
  {{- if not (has "k8sattributes" $config.service.pipelines.traces.processors) }}
    {{- $_ := set $config.service.pipelines.traces "processors" (prepend $config.service.pipelines.traces.processors "k8sattributes" | uniq)  }}
  {{- end }}
{{- end }}
{{- $config | toYaml }}
{{- end }}

{{- define "opentelemetryCollector.kubernetesAttributesConfig" -}}
processors:
  k8sattributes:
  {{- if eq .Values.opentelemetryCollector.mode "daemonset" }}
    filter:
      node_from_env_var: K8S_NODE_NAME
  {{- end }}
    passthrough: false
    pod_association:
    - sources:
      - from: resource_attribute
        name: k8s.pod.ip
    - sources:
      - from: resource_attribute
        name: k8s.pod.uid
    - sources:
      - from: connection
    extract:
      metadata:
        - "k8s.namespace.name"
        - "k8s.deployment.name"
        - "k8s.statefulset.name"
        - "k8s.daemonset.name"
        - "k8s.cronjob.name"
        - "k8s.job.name"
        - "k8s.node.name"
        - "k8s.pod.name"
        - "k8s.pod.uid"
        - "k8s.pod.start_time"
      {{- if .Values.opentelemetryCollector.presets.kubernetesAttributes.extractAllPodLabels }}
      labels:
        - tag_name: $$1
          key_regex: (.*)
          from: pod
      {{- end }}
      {{- if .Values.opentelemetryCollector.presets.kubernetesAttributes.extractAllPodAnnotations }}
      annotations:
        - tag_name: $$1
          key_regex: (.*)
          from: pod
      {{- end }}
{{- end }}

{{- define "opentelemetryCollector.applyKubernetesEventsConfig" -}}
{{- $config := mustMergeOverwrite (dict "service" (dict "pipelines" (dict "logs" (dict "receivers" list)))) (include "opentelemetryCollector.kubernetesEventsConfig" .Values.opentelemetryCollector | fromYaml) .config }}
{{- $_ := set $config.service.pipelines.logs "receivers" (append $config.service.pipelines.logs.receivers "k8sobjects" | uniq)  }}
{{- $config | toYaml }}
{{- end }}

{{- define "opentelemetryCollector.kubernetesEventsConfig" -}}
receivers:
  k8sobjects:
    objects:
      - name: events
        mode: "watch"
        group: "events.k8s.io"
        exclude_watch_type:
          - "DELETED"
{{- end }}