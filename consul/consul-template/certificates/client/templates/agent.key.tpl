{{ $domain := (env "DOMAIN") }}
{{ $datacenter := (env "CONSUL_DATACENTER") }}
{{ $ip_address := ( sockaddr "GetPrivateIP" ) }}
{{ with secret "pki_int/issue/agent-cluster" (printf "common_name=client.%v.consul" $datacenter) (printf "alt_names=localhost,*.%v,*.service.consul,network*.node.consul,network*.%v" $domain $datacenter) (printf "ip_sans=127.0.0.1,%v" $ip_address) "ttl=720h"}}{{ .Data.private_key }}{{ end }}
