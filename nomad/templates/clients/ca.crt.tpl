{{ with secret "pki_int/issue/nomad-cluster" "common_name=client.global.nomad" "ttl=24h"}}
{{ .Data.issuing_ca }}
{{ end }}