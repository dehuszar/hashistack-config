listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_cert_file = "/etc/certs/vault-server-agent.crt"
  tls_key_file = "/etc/certs/vault-server-agent.key"
}
