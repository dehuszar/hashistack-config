// duplicate the contents of the main listener with the resolvable ip address
// of the node to be able to access the ui from the local network
// FIXME :: convert into a consul-template print-out where the IP_ADDRESS is looked up dynamically
listener "tcp" {
  address     = "<IP_ADDRESS>:8200"
  tls_cert_file = "/etc/certs/vault-server-agent.crt"
  tls_key_file = "/etc/certs/vault-server-agent.key"
}