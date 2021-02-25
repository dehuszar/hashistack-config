{{ $domain := (env "DOMAIN") }}
{{ with secret "pki_int/issue/agent-cluster" (printf "common_name=%v" $domain) "ttl=720h"}}{{ .Data.issuing_ca }}{{ end }}
