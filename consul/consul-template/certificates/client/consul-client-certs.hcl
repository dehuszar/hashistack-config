vault {
  # address provided as arg
  # token provided as env var
  unwrap_token = false
  renew_token  = false
}

syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/certificates/consul/client/templates/agent.crt.tpl"
  destination = "/etc/certs/consul-client-agent.crt"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/certificates/consul/client/templates/agent.key.tpl"
  destination = "/etc/certs/consul-client-agent.key"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/certificates/consul/cli/templates/cli.crt.tpl"
  destination = "/etc/certs/consul-cli.crt"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/certificates/consul/cli/templates/cli.key.tpl"
  destination = "/etc/certs/consul-cli.key"
  perms       = 0444
}

exec {
  command = "systemctl reload consul"
}