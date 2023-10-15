listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_cert_file = "{{ env "VAULT_CACERT" }}"
  tls_cert_file = "{{ env "VAULT_SERVER_AGENT_CERT" }}"
  tls_key_file  = "{{ env "VAULT_SERVER_AGENT_KEY" }}"
}
