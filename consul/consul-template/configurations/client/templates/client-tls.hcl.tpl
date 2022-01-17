ca_file   = "{{ env "CONSUL_CACERT" }}"
cert_file = "{{ env "CONSUL_CLIENT_CERT" }}"
key_file  = "{{ env "CONSUL_CLIENT_KEY" }}"

auto_encrypt {
    tls = {{ env "CONSUL_HTTP_SSL_AUTO_ENCRYPT" }}
}

# This applies to clients and servers as both will make outgoing connections.
# https://www.consul.io/docs/agent/options#verify_outgoing
verify_outgoing = {{ env "CONSUL_HTTP_SSL_VERIFY_OUTGOING" }}

ports {
    http  =-1,
    https = 8501
}
