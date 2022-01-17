consul {
  address = "https://127.0.0.1:8501"

  retry {
    attempts = 12
    backoff = "250ms"
    enabled = true
    max_backoff = "1m"
  }

  ssl {
    ca_cert = "/etc/certs/consul-ca.crt"
    cert = "/etc/certs/consul-cli.crt"
    enabled = true
    key  = "/etc/certs/consul-cli.key"
    verify = true
  }
}

kill_signal = "SIGINT"
log_level = "warn"
max_stale = "10m"
pristine = true
reload_signal = "SIGHUP"
sanitize = false

syslog {
  # This enables syslog logging. Specifying any other option also enables
  # syslog logging.
  enabled = true

  # This is the name of the syslog facility to log to.
  facility = "LOCAL5"
}

upcase = true

# This denotes the start of the configuration section for Vault. All values
# contained in this section pertain to Vault.
vault {
  # This is the address of the Vault leader. The protocol (http(s)) portion
  # of the address is required.
  address = "https://vault.service.consul:8200"

  # This tells Envconsul to load the Vault token from the contents of a file.
  # If this field is specified:
  # - by default Envconsul will not try to renew the Vault token, if you want it
  # to renew you will need to specify renew_token = true as below.
  # - Envconsul will periodically stat the file and update the token if it has
  # changed.
  # vault_agent_token_file = "/path/to/vault/agent/token/file"


  # This tells Envconsul that the provided token is actually a wrapped
  # token that should be unwrapped using Vault's cubbyhole response wrapping
  # before being used. Please see Vault's cubbyhole response wrapping
  # documentation for more information.
  unwrap_token = false

  # This option tells Envconsul to automatically renew the Vault token given.
  # If you are unfamiliar with Vault's architecture, Vault requires tokens be
  # renewed at some regular interval or they will be revoked. Envconsul will
  # automatically renew the token at half the lease duration of the token. The
  # default value is true (exception below), but this option can be disabled if
  # you want to renew the Vault token using an out-of-band process.
  # 
  # There is an exception to the default such that if vault_agent_token_file is
  # set, either from the command line or the above option, renew_token defaults
  # to false to avoid renewal conflicts between envconsul and vault-agent.
  #
  # Note that secrets specified as a prefix are always renewed, even if this
  # option is set to false. This option only applies to the top-level Vault
  # token itself.
  renew_token = false

  # This section details the SSL options for connecting to the Vault server.
  # Please see the SSL options in the Consul section for more information (they
  # are the same).
  ssl {
    ca_cert = "/etc/certs/vault-ca.crt"
    cert = "/etc/certs/vault-cli.crt"
    enabled = true
    key  = "/etc/certs/vault-cli.key"
    verify = true
  }

# This specifies a service in Consul to watch. This may be specified multiple
# times to watch multiple prefixes, and the bottom-most service takes
# precedence, should any values overlap.
# service {
#   # This is the query of the service in Consul from which to read data.
#   query = "my-service"

#   # This tells Envconsul to use a custom formatter when printing the key. The
#   # value between `{{ key }}` and `{{ service }}` will be replaced with the key
#   # and service name. Default format `{{ service }}/{{ key }}`
#   format_id = "pg/{{ key }}"
#   format_name = "pg/{{ key }}"
#   format_address = "pg/host"
#   format_tag = "pg/{{ key }}"
#   format_port = "pg/{{ key }}"
# }

# This is the quiescence timers; it defines the minimum and maximum amount of
# time to wait for the cluster to reach a consistent state before relaunching
# the app. This is useful to enable in systems that have a lot of flapping,
# because it will reduce the the number of times the app is restarted.
wait {
  min = "5s"
  max = "10s"
}