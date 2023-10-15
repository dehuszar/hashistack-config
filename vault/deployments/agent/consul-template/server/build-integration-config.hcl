syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/vault/templates/consul.hcl.tpl"
  destination = "/etc/vault.d/consul.hcl"
  perms       = 0444
}

exec {
  command = "sudo bash -c 'chown vault:vault /etc/vault.d/*.hcl'"
}