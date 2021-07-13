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

# EnvironmentFile
template {
  source      = "/etc/consul-template.d/certificates/vault/templates/server-cert-gen.service.conf.tpl"
  destination = "/etc/systemd/system/vault-server-cert-gen.d/vault-server-cert-gen.service.conf"
  perms       = 0444
}

# Service definition
template {
  source      = "/etc/consul-template.d/certificates/vault/templates/server-cert-gen.service.tpl"
  destination = "/etc/systemd/system/vault-server-cert-gen.service"
  perms       = 0444
}

# Timer
template {
  source      = "/etc/consul-template.d/certificates/vault/templates/server-cert-gen.timer.tpl"
  destination = "/etc/systemd/system/vault-server-cert-gen.timer"
  perms       = 0444
}

exec {
  command = "sudo bash -c 'sudo bash /etc/consul-template.d/certificates/vault/update-server-cert-gen-systemd-service.sh'"
}