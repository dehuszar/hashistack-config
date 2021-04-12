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
  source      = "/etc/consul-template.d/certificates/nomad/templates/ca.crt.tpl"
  destination = "/etc/certs/nomad-ca.crt"
  perms       = 0444
}

template {
  source      = "/etc/certs/templates/nomad/server/agent.crt.tpl"
  destination = "/etc/certs/nomad-server-agent.crt"
  perms       = 0444
}

template {
  source      = "/etc/certs/templates/nomad/server/agent.key.tpl"
  destination = "/etc/certs/nomad-server-agent.key"
  perms       = 0444
}

template {
  source      = "/etc/certs/templates/nomad/cli/cli.crt.tpl"
  destination = "/etc/certs/nomad-cli.crt"
  perms       = 0444
}

template {
  source      = "/etc/certs/templates/nomad/cli/cli.key.tpl"
  destination = "/etc/certs/nomad-cli.key"
  perms       = 0444
}

exec {
  command     = "systemctl reload nomad"
}