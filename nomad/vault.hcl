// This config stanza belongs in your /etc/nomad.d folder for vault communication to work
// uncomment to enable

vault {
  enabled = true
  address = "https://127.0.0.1:8200"
  task_token_ttl = "1h"
  create_from_role = "nomad-cluster"
  token = ""
}
