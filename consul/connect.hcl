connect {
    enabled = true
    ca_provider = "vault"
    ca_config {
        address = "https://localhost:8200"
        token = "..."
    }
}
