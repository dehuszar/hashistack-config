{{ $domain := (env "DOMAIN") }}
{{ $datacenter := (env "CONSUL_DATACENTER") }}
{{ $hostname := (env "HOSTNAME") }}
{{ $ip_address := ( sockaddr "GetPrivateIP" ) }}
{{ with secret "pki_int/issue/agent-cluster" (printf "common_name=server.%v.consul" $datacenter) (printf "alt_names=localhost,*.%v,*.service.consul,%v.node.consul,%v.%v" $domain $hostname $hostname $datacenter) (printf "ip_sans=127.0.0.1,%v" $ip_address) "ttl=720h"}}{{ .Data.private_key }}{{ end }}
