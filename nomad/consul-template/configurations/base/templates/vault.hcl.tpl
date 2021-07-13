// This config stanza belongs in your /etc/nomad.d folder for vault communication to work
// uncomment to enable

vault {
  enabled = {{ env "NOMAD_VAULT_ENABLED" }}
  address = "{{ env "VAULT_ADDR" }}"
  ca_file = "{{ env "VAULT_CACERT" }}"
  cert_file = "{{ env "VAULT_CLIENT_CERT" }}"
  key_file = "{{ env "VAULT_CLIENT_KEY" }}"
  {{ if env "NOMAD_VAULT_CREATE_FROM_ROLE" | parseBool }}create_from_role = "{{ env "NOMAD_VAULT_CREATE_FROM_ROLE"}}"{{ end }}
}
