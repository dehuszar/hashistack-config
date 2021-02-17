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
  source      = "/etc/consul-template.d/certificates/vault/templates/agent.crt.tpl"
  destination = "/etc/certs/vault-server-agent.crt"
  perms       = 0700
}

template {
  source      = "/etc/consul-template.d/certificates/vault/templates/agent.key.tpl"
  destination = "/etc/certs/vault-server-agent.key"
  perms       = 0700
}

template {
  source      = "/etc/consul-template.d/certificates/vault/templates/cli.crt.tpl"
  destination = "/etc/certs/vault-cli.crt"
}

template {
  source      = "/etc/consul-template.d/certificates/vault/templates/cli.key.tpl"
  destination = "/etc/certs/vault-cli.key"
}
