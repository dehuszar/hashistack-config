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
  source      = "/etc/consul-template.d/certificates/nomad/templates/client-cert-gen.service.conf.tpl"
  destination = "/etc/systemd/system/nomad-client-cert-gen.d/nomad-client-cert-gen.service.conf"
  perms       = 0444
}

# Service definition
template {
  source      = "/etc/consul-template.d/certificates/nomad/templates/client-cert-gen.service.tpl"
  destination = "/etc/systemd/system/nomad-client-cert-gen.service"
  perms       = 0444
}

# Timer
template {
  source      = "/etc/consul-template.d/certificates/nomad/templates/client-cert-gen.timer.tpl"
  destination = "/etc/systemd/system/nomad-client-cert-gen.timer"
  perms       = 0444
}

exec {
  command = "sudo bash -c 'sudo bash /etc/consul-template.d/certificates/consul/update-client-cert-gen-systemd-service.sh'"
}