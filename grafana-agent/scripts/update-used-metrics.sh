# This script pulls down grafana configs from a Consul KV and queries the Dashboards on the account
# to see which metrics are being used.  These metrics can then added to a global regex used to
# filter out metrics to keep.  This process is necessary to keep under the limits of Grafana Cloud's free-tier


envconsul -pristine -consul-addr="https://consul.service.consul:8501" -vault-renew-token=false -vault-unwrap-token=false -no-prefix=true -secret secret/essentialforms/services/grafana-cloud -prefix essentialforms/services/grafana-cloud cortextool analyse grafana
jq '.metricsUsed' metrics-in-grafana.json | tr -d '", ' | sed '1d;$d' | grep -v 'grafanacloud*' | paste -s -d '|' -