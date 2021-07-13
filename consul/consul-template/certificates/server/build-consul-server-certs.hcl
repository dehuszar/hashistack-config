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
  source      = "/etc/consul-template.d/certificates/consul/templates/ca.crt.tpl"
  destination = "/etc/certs/consul-ca.crt"
  perms       = 0644
}

template {
  source      = "/etc/consul-template.d/certificates/consul/templates/agent.crt.tpl"
  destination = "/etc/certs/consul-server-agent.crt"
  perms       = 0644
}

template {
  source      = "/etc/consul-template.d/certificates/consul/templates/agent.key.tpl"
  destination = "/etc/certs/consul-server-agent.key"
  perms       = 0644
}

template {
  source      = "/etc/consul-template.d/certificates/consul/templates/cli.crt.tpl"
  destination = "/etc/certs/consul-cli.crt"
}

template {
  source      = "/etc/consul-template.d/certificates/consul/templates/cli.key.tpl"
  destination = "/etc/certs/consul-cli.key"
}

exec {
  command = "sudo systemctl restart consul"
}