syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/nomad/templates/base.hcl.tpl"
  destination = "/etc/nomad.d/base.hcl"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/configurations/nomad/templates/plugins.hcl.tpl"
  destination = "/etc/nomad.d/plugins.hcl"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/configurations/nomad/templates/telemetry.hcl.tpl"
  destination = "/etc/nomad.d/telemetry.hcl"
  perms       = 0444
}

exec {
  command = "sudo bash -c 'chown nomad:nomad /etc/nomad.d/*.hcl'"
}