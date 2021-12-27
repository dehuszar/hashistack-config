syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/grafana-agent/templates/grafana-agent.yaml.tpl"
  destination = "/etc/grafana-agent.yaml"
  perms       = 0444
}

exec {
  command = "sudo systemctl restart grafana-agent"
}
