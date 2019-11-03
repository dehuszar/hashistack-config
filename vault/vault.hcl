storage "consul" {
  address = "{{ GetInterfaceIP \"eth0\" }}:8500"
  path    = "vault/"
}

listener "tcp" {
  address     = "{{ GetInterfaceIP \"eth0\" }}:8200"
  tls_disable = 1
}