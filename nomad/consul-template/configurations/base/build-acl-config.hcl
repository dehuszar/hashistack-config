syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/configurations/nomad/templates/acl.hcl.tpl"
  destination = "/etc/nomad.d/acl.hcl"
  perms       = 0600
}

exec {
  command = "sudo bash -c 'chown nomad:nomad /etc/nomad.d/*.hcl'"
}