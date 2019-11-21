// This config stanza belongs in your /etc/nomad.d folder for consul communication to work
// uncomment to enable

// consul {
//   address = "{{ GetInterfaceIP \"eth0\"}}:8500"
  
//   # Enables automatically registering the services.
//   auto_advertise = true

//   # Enabling the server and client to bootstrap using Consul.
//   server_auto_join = true
//   client_auto_join = true
// }