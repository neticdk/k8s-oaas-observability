# Netic OaaS CI

Collection of scripts used when running CI for the chart. _Note_ when developing the chart locally
it is required to also run the generation of recording and alerting rules.

The following tools are required to run the generation of recording and alerting rules:
- jsonnet
- jb (jsonnet bundler)

It is possible to run the generation by hand just running the script `update-rules.sh`

```bash
$ ./update-rules.sh
~/Projects/charts.oaas/netic-oaas/ci ~/Projects/charts.oaas/netic-oaas
GET https://github.com/kubernetes-monitoring/kubernetes-mixin/archive/5c07e1de2c8ea4f8fdcc1985712daa5e751a327f.tar.gz 200
GET https://github.com/etcd-io/etcd/archive/cd3df73944a82321ea9c64c543065883d20a2678.tar.gz 200
GET https://github.com/grafana/grafonnet-lib/archive/cc1626a1b4dee45c99b78ddd9714dfd5f5d7816e.tar.gz 200
GET https://github.com/grafana/jsonnet-libs/archive/ecc83f569bbf56f2863e9c3cefa4487e3253aaa6.tar.gz 200
Generating Kubernetes recording rules
Generating Kubernetes alerting rules
Generating etcd alerting rules
~/Projects/charts.oaas/netic-oaas
```
