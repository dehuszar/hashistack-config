vault {
  # address provided as arg
  # token provided as env var
  unwrap_token = false
  renew_token  = false
}

syslog {
  enabled  = true
  facility = "LOCAL5"
}

template {
  source      = "/etc/consul-template.d/certificates/consul/templates/browser-ca.crt.tpl"
  destination = "/etc/certs/browser-ca.crt"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/certificates/consul/templates/browser.crt.tpl"
  destination = "/etc/certs/browser.crt"
  perms       = 0444
}

template {
  source      = "/etc/consul-template.d/certificates/consul/templates/browser.key.tpl"
  destination = "/etc/certs/browser.key"
  perms       = 0444
}

exec {
  command = "openssl pkcs12 -export -out /etc/certs/browser.p12 -inkey /etc/certs/browser.key -in /etc/certs/browser.crt -certfile /etc/certs/browser-ca.crt"
}