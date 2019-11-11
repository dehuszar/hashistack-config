datacenter = "home"
data_dir = "/opt/nomad"

consul {
  address = "{{ GetInterfaceIP \"eth0\"}}:8500"
  
  # Enables automatically registering the services.
  auto_advertise = true

  # Enabling the server and client to bootstrap using Consul.
  server_auto_join = true
  client_auto_join = true
}

vault {
  enabled = true
  address = "{{ GetInterfaceIP \"eth0\"}}:8200"
}
