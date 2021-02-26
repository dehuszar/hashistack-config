{{ $datacenter := (env "CONSUL_DATACENTER") }}
{{ $domain := (env "DOMAIN") }}
{{ $ip_address := ( sockaddr "GetPrivateIP" ) }}
{{ with secret "pki_int/issue/agent-cluster" (printf "common_name=%v" $domain) (printf "alt_names=localhost,*.service.consul,network*.node.consul,network*.%v" $datacenter) (printf "ip_sans=127.0.0.1,%v" $ip_address) "ttl=720h"}}{{ .Data.private_key }}{{ end }}
