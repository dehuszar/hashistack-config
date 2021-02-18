{{ with secret "pki_int/issue/agent-cluster" "common_name=vault.service.consul" "alt_names=localhost" "ip_sans=127.0.0.1" "ttl=720h" }}{{ .Data.certificate }}{{ end }}
