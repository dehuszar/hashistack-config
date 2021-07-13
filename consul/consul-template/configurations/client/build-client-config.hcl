syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/consul/templates/acl.hcl.tpl"
  destination = "/etc/consul.d/acl.hcl"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/configurations/consul/templates/base.hcl.tpl"
  destination = "/etc/consul.d/base.hcl"
  perms       = 0444
}

exec {
  command = "sudo bash -c 'chown consul:consul /etc/consul.d/*.hcl' && sudo systemctl daemon-reload && sudo systemctl restart consul"
}