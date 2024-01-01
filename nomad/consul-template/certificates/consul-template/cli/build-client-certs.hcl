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

# The following template stanzas are for the CLI certs
template {
  source      = "/etc/consul-template.d/certificates/nomad/templates/cli.crt.tpl"
  destination = "/etc/certs/nomad-cli.crt"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/certificates/nomad/templates/cli.key.tpl"
  destination = "/etc/certs/nomad-cli.key"
  perms       = 0444
}

exec {
  command     = "systemctl reload nomad"
}
