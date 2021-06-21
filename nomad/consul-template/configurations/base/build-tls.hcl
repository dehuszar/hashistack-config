syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/nomad/templates/tls.hcl.tpl"
  destination = "/etc/nomad.d/tls.hcl"
  perms       = 0444
}

exec {
  command = "sudo bash -c 'chown nomad:nomad /etc/nomad.d/*.hcl'"
}