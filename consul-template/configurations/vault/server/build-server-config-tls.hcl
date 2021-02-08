syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/vault/templates/base.hcl.tpl"
  destination = "/etc/vault.d/base.hcl"
  perms       = 0600
}

template {
  source      = "/etc/consul-template.d/configurations/vault/templates/listener.hcl.tpl"
  destination = "/etc/vault.d/listener.hcl"
  perms       = 0600
}

template {
  source      = "/etc/consul-template.d/configurations/vault/templates/seal.hcl.tpl"
  destination = "/etc/vault.d/seal.hcl"
  perms       = 0600
}

template {
  source      = "/etc/consul-template.d/configurations/vault/templates/storage.hcl.tpl"
  destination = "/etc/vault.d/storage.hcl"
  perms       = 0600
}

template {
  source      = "/etc/consul-template.d/configurations/vault/templates/telemetry.hcl.tpl"
  destination = "/etc/vault.d/telemetry.hcl"
  perms       = 0600
}

exec {
  command = "sudo bash -c 'chown vault:vault /etc/vault.d/*.hcl'"
}