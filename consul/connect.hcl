connect {
  enabled = true
  ca_provider = "vault"
  ca_config {
    address = "https://localhost:8200"
    intermediate_pki_path = "connect-intermediate"
    root_pki_path = "connect-root"
    token = "..."
  }
}
