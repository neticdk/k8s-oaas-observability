local dashboards = (import 'github.com/etcd-io/etcd/Documentation/etcd-mixin/mixin.libsonnet').grafanaDashboards;
{
  [name]: dashboards[name] {
    tags+: ['netic-oaas'],
  }
  for name in std.objectFields(dashboards)
}
