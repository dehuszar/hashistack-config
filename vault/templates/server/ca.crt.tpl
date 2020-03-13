{{ with secret "pki_int/issue/vault-cluster" "common_name=vault.service.consul" "ttl=24h"}}
{{ .Data.issuing_ca }}
{{ end }}