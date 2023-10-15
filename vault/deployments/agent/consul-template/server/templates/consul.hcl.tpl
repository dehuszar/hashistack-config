service_registration "consul" {
  address       = "{{ env "CONSUL_HTTP_ADDR" }}"
  tls_ca_file   = "{{ env "CONSUL_CACERT" }}"
  tls_cert_file = "{{ env "CONSUL_CLIENT_CERT" }}"
  tls_key_file  = "{{ env "CONSUL_CLIENT_KEY" }}"
  token         = "{{ env "CONSUL_HTTP_TOKEN" }}"
}