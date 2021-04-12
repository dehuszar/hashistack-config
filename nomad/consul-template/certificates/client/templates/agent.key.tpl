{{ $domain := (env "DOMAIN") }}
{{ $datacenter := (env "CONSUL_DATACENTER") }}
{{ $ip_address := ( sockaddr "GetPrivateIP" ) }}
{{ with secret "pki_int/issue/agent-cluster" "common_name=client.global.nomad" (printf "alt_names=localhost,*.%v,*.global.nomad,*.%v,*.%v.consul,*.node.consul,*.service.consul" $domain $datacenter $datacenter) (printf "ip_sans=127.0.0.1,%v" $ip_address) "ttl=720h"}}{{ .Data.private_key }}{{ end }}
