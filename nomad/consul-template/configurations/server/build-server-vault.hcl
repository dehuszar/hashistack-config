syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/nomad/templates/vault.hcl.tpl"
  destination = "/etc/nomad.d/vault.hcl"
  perms       = 0444
}

exec {
  command = "sudo bash -c 'chown nomad:nomad /etc/nomad.d/*.hcl'"
}