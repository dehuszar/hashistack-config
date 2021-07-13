syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/consul/templates/encrypt.hcl.tpl"
  destination = "/etc/consul.d/encrypt.hcl"
  perms       = 0444
}

exec {
  command = "sudo bash -c 'chown consul:consul /etc/consul.d/*.hcl' && sudo systemctl daemon-reload && sudo systemctl restart consul"
}