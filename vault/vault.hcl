// opting for the new vault storage option, and not linking to an external consul cluster
storage "raft" {}

service_registration "consul" {
  address = "https://localhost:8501"
  tls_ca_file = "/etc/certs/ca.crt"
  tls_cert_file = "/etc/certs/consul-client-agent.crt"
  tls_key_file = "/etc/certs/consul-client-agent.key"
  token = ""
}

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = true
  tls_disable_client_certs = "true"
}

telemetry {
  prometheus_retention_time = "48h"
  disable_hostname = true
}

log_level = "INFO"
