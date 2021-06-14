{{ with $ip_address := ( sockaddr "GetPrivateIP" ) }}
{{ with secret "pki_int/issue/agent-cluster" "common_name=client.home.consul" "alt_names=localhost,*.***REMOVED***,*.global.nomad,*.home,*.home.consul,*.node.consul,*.service.consul" (printf "ip_sans=127.0.0.1,%v" $ip_address) "ttl=720h"}}{{ .Data.certificate }}{{ end }}
{{ end }}
