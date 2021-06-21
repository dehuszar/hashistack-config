tls {
  http = {{ env "NOMAD_TLS_HTTP_ENABLED" }}
  rpc  = {{ env "NOMAD_TLS_RPC_ENABLED" }}

  ca_file   = {{ env "NOMAD_CACERT" }}
  {{ if env "NOMAD_SERVER_CERT" | parseBool }}
    cert_file = {{ env "NOMAD_SERVER_CERT" }}
    key_file  = {{ env "NOMAD_SERVER_KEY" }}
  {{ else }}
    cert_file = {{ env "NOMAD_CLIENT_CERT" }}
    key_file  = {{ env "NOMAD_CLIENT_KEY" }}
  {{ end }}

  rpc_upgrade_mode       = {{ env "NOMAD_RPC_UPGRADE_MODE" }} 
  verify_server_hostname = {{ env "NOMAD_VERIFY_SERVER_HOSTNAME" }}
  verify_https_client    = {{ env "NOMAD_VERIFY_HTTPS_CLIENT" }}
}
