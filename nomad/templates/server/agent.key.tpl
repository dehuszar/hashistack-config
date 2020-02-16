{{ with secret "pki_int/issue/nomad-cluster" "common_name=nomad.service.consul" "alt_names=localhost" "ip_sans=127.0.0.1" "ttl=24h"}}
{{ .Data.private_key }}
{{ end }}
