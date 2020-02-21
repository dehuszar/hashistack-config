{{ with secret "pki_int/issue/nomad-cluster" "common_name=client.global.nomad" "alt_names=localhost,nomad-client.service.consul" "ip_sans=127.0.0.1" "ttl=24h"}}
{{ .Data.certificate }}
{{ end }}