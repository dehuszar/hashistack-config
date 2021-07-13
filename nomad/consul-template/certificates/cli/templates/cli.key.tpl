{{ with secret "pki_int/issue/agent-cluster" "common_name=client.global.nomad" "alt_names=localhost" "ip_sans=127.0.0.1" "ttl=720h"}}{{ .Data.private_key }}{{ end }}
