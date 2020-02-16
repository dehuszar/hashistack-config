{{ with secret "pki_int/issue/nomad-cluster" "common_name=nomad-client.consul.service" "ttl=24h"}}
{{ .Data.issuing_ca }}
{{ end }}