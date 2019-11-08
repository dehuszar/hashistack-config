datacenter = "home"
data_dir = "/opt/nomad"

consul {
  address = "{{ GetInterfaceIP \"eth0\"}}:8500"
  server_service_name = "nomad-server"
  client_service_name = "nomad-client"
  auto_advertise = true
  server_auto_join = true
  client_auto_join = true
}

vault {
  enabled = true
  address = "{{ GetInterfaceIP \"eth0\"}}:8200"
}
