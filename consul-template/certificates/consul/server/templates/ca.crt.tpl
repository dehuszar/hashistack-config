{{ $datacenter := (env "CONSUL_DATACENTER") }}
{{ with secret "pki_int/issue/agent-cluster" (printf "common_name=%v.consul" $datacenter) "ttl=720h"}}{{ .Data.issuing_ca }}{{ end }}