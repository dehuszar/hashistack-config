consul {
  address = "127.0.0.1:8501"
  ca_file = "/etc/nomad.d/keys/consul-agent-ca.pem"
  cert_file = "/etc/nomad.d/keys/home-cli-consul-0.pem"
  key_file = "/etc/nomad.d/keys/home-cli-consul-0-key.pem"
  ssl = true
}