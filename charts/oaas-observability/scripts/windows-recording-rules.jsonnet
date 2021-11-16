local mixin = (import 'github.com/kubernetes-monitoring/kubernetes-mixin/rules/windows.libsonnet') +
  (import 'github.com/kubernetes-monitoring/kubernetes-mixin/config.libsonnet') +
  ({
  _config+:: {
    grafanaK8s: {
      dashboardNamePrefix: 'Netic OaaS / ',
      dashboardTags: ['netic-oaas','kubernetes-mixin'],
      linkPrefix: '',
      refresh: '10s',
      minimumTimeInterval: '1m',
      grafanaTimezone: 'browser',
    },
    wmiExporterSelector: 'job="windows-exporter"',
  },
});

std.manifestYamlDoc(mixin.prometheusRules)
