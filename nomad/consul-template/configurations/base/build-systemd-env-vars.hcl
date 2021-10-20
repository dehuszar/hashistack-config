syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/nomad/templates/service.conf.tpl"
  destination = "/etc/systemd/system/nomad.d/service.conf"
  perms       = 0444
}

exec {
  command = "sudo systemctl reload nomad"
}
