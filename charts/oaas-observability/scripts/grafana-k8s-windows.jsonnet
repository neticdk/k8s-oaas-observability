local mixin = (import 'github.com/kubernetes-monitoring/kubernetes-mixin/dashboards/windows.libsonnet') +
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

local dashboards = mixin.grafanaDashboards;
{
  [name]: dashboards[name]
  for name in std.objectFields(dashboards)
}
