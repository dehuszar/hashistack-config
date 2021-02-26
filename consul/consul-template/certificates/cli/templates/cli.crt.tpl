{{ $datacenter := (env "CONSUL_DATACENTER") }}
{{ $ip_address := ( sockaddr "GetPrivateIP" ) }}
{{ with secret "pki_int/issue/agent-cluster" (printf "common_name=client.%v.consul" $datacenter) "alt_names=localhost" (printf "ip_sans=127.0.0.1,%v" $ip_address) "ttl=720h"}}{{ .Data.certificate }}{{ end }}
