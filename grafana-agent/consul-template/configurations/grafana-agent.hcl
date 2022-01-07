vault {
  renew_token  = false
  unwrap_token = false
}

syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/grafana-agent/templates/grafana-agent.yaml.tpl"
  destination = "/etc/grafana-agent.yaml"
  perms       = 0644

  wait {
    min = "1s"
    max = "5s"
  }
}

log_level = "debug"

exec {
  command = "sudo systemctl restart grafana-agent.service"
}
