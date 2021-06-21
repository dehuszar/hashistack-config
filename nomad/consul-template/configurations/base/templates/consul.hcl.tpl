consul {
  address = "{{ env "CONSUL_HTTP_ADDR" }}"

  ca_file = "{{ env "CONSUL_CACERT" }}"
  cert_file = "{{ env "CONSUL_CLIENT_CERT" }}"
  key_file = "{{ env "CONSUL_CLIENT_KEY" }}"

  ssl = {{ env "CONSUL_HTTP_SSL" }}
  # tags = FIXME
}