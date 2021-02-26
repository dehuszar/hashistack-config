acl {
  enabled                  = {{ env "CONSUL_ACL_ENABLED" }}
  default_policy           = "{{ env "CONSUL_ACL_DEFAULT_POLICY" }}"
  down_policy              = "{{ env "CONSUL_ACL_DOWN_POLICY" }}"
  enable_token_persistence = {{ env "CONSUL_ACL_ENABLE_TOKEN_PERSISTENCE" }}

  tokens {
    agent = "{{ env "CONSUL_HTTP_TOKEN" }}"
  }
}