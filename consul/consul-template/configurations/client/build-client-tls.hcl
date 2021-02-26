syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/consul/client/templates/tls/tls.hcl.tpl"
  destination = "/etc/consul.d/tls.hcl"
  perms       = 0444
}

exec {
  command = "sudo bash -c 'chown consul:consul /etc/consul.d/*.hcl'"
}