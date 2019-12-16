consul {
  address = "0.0.0.0:8501"
  ca_file = "/etc/vault.d/keys/consul-agent-ca.pem"
  cert_file = "/etc/vault.d/keys/home-cli-consul-0.pem"
  key_file = "/etc/vault.d/keys/home-cli-consul-0-key.pem"
  ssl = true
  token = ""
}