ca_file   = "{{ env "CONSUL_CACERT" }}"
cert_file = "{{ env "CONSUL_SERVER_CERT" }}"
key_file  = "{{ env "CONSUL_SERVER_KEY" }}"

auto_encrypt {
    tls = true
}

# This applies to clients and servers as both will make outgoing connections.
# https://www.consul.io/docs/agent/options#verify_outgoing
verify_outgoing = {{ env "CONSUL_HTTP_SSL_VERIFY" }}

ports {
    http  =-1,
    https = 8501
}