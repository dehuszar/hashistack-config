# This denotes the start of the configuration section for Vault. All values
# contained in this section pertain to Vault.
vault {
  # This is the address of the Vault leader. The protocol (http(s)) portion
  # of the address is required.
  address      = "https://vault.service.consul:8200"

  # This value can also be specified via the environment variable VAULT_TOKEN.
  # token        = "REPLACE_WITH_VAULT_TOKEN"

  # This tells Consul Template to load the Vault token from the contents of a file.
  # If this field is specified:
  # - by default Consul Template will not try to renew the Vault token, if you want it
  # to renew you will need to specify renew_token = true as below.
  # - Consul Template will periodically stat the file and update the token if it has
  # changed.
  vault_agent_token_file = "/opt/vault/tokens/nomad"

  # This should also be less than or around 1/3 of your TTL for a predictable
  # behaviour. See https://github.com/hashicorp/vault/issues/3414
  # grace        = "1s"

  # This tells Consul Template that the provided token is actually a wrapped
  # token that should be unwrapped using Vault's cubbyhole response wrapping
  # before being used. Please see Vault's cubbyhole response wrapping
  # documentation for more information.
  unwrap_token = false

  # This option tells Consul Template to automatically renew the Vault token
  # given. If you are unfamiliar with Vault's architecture, Vault requires
  # tokens be renewed at some regular interval or they will be revoked. Consul
  # Template will automatically renew the token at half the lease duration of
  # the token. The default value is true, but this option can be disabled if
  # you want to renew the Vault token using an out-of-band process.
  renew_token  = true
}

# This block defines the configuration for connecting to a syslog server for
# logging.
syslog {
  enabled  = true

  # This is the name of the syslog facility to log to.
  facility = "LOCAL5"
}

# This block defines the configuration for a template. Unlike other blocks,
# this block may be specified multiple times to configure multiple templates.
template {
  # This is the source file on disk to use as the input template. This is often
  # called the "Consul Template template". 
  source      = "/opt/nomad/templates/agent.crt.tpl"

  # This is the destination path on disk where the source template will render.
  # If the parent directories do not exist, Consul Template will attempt to
  # create them, unless create_dest_dirs is false.
  destination = "/opt/nomad/agent-certs/agent.crt"

  # This is the permission to render the file. If this option is left
  # unspecified, Consul Template will attempt to match the permissions of the
  # file that already exists at the destination path. If no file exists at that
  # path, the permissions are 0644.
  perms       = 0700

  # This is the optional command to run when the template is rendered. The
  # command will only run if the resulting template changes. 
  command     = "systemctl reload nomad"
}

template {
  source      = "/opt/nomad/templates/agent.key.tpl"
  destination = "/opt/nomad/agent-certs/agent.key"
  perms       = 0700
  command     = "systemctl reload nomad"
}

template {
  source      = "/opt/nomad/templates/ca.crt.tpl"
  destination = "/opt/nomad/agent-certs/ca.crt"
  command     = "systemctl reload nomad"
}

# The following template stanzas are for the CLI certs

template {
  source      = "/opt/nomad/templates/cli.crt.tpl"
  destination = "/opt/nomad/cli-certs/cli.crt"
}

template {
  source      = "/opt/nomad/templates/cli.key.tpl"
  destination = "/opt/nomad/cli-certs/cli.key"
}
