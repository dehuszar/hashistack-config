{{ with secret "pki_int/issue/pki-nomad-cluster" "common_name=server.global.nomad" "ttl=24h" "alt_names=localhost" "ip_sans=127.0.0.1"}}
{{ .Data.certificate }}
{{ end }}