syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/nomad/templates/service.conf.tpl"
  destination = "/etc/systemd/system/nomad.d/service.conf"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/configurations/nomad/templates/base.hcl.tpl"
  destination = "/etc/nomad.d/base.hcl"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/configurations/nomad/templates/plugin-podman.hcl.tpl"
  destination = "/etc/nomad.d/plugin-podman.hcl"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/configurations/nomad/templates/telemetry.hcl.tpl"
  destination = "/etc/nomad.d/telemetry.hcl"
  perms       = 0444
}

exec {
  command = "sudo bash -c 'chown nomad:nomad /etc/nomad.d/*.hcl' && sudo systemctl daemon-reload && sudo systemctl restart nomad"
}
