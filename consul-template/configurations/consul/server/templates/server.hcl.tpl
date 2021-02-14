server           = {{ env "CONSUL_SERVER" }}
bootstrap_expect = {{ env "CONSUL_BOOTSTRAP_EXPECT" }}
ui               = {{ env "CONSUL_UI" }}

{{if env "CONSUL_HTTP_SSL" | parseBool}}
verify_incoming        = {{ env "CONSUL_HTTP_SSL_VERIFY_INCOMING" }}
verify_server_hostname = {{ env "CONSUL_HTTP_SSL_VERIFY_SERVER_HOSTNAME" }}
{{end}}