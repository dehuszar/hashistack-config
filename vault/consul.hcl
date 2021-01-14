service_registration "consul" {
  address = "https://localhost:8501"
  tls_ca_file = "/etc/certs/ca.crt"
  tls_cert_file = "/etc/certs/consul-client-agent.crt"
  tls_key_file = "/etc/certs/consul-client-agent.key"
  token = ""
}