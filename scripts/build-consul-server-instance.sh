# This should include every step to stand up a new Consul server agent including
# setting up the Vault agent, setting up the TLS certificate generation
# service

## FIRST TIME SETUP

# Note :: this needs to be a Ansible playbook, I'm just documenting steps for now
./scripts/install-hashi-binary.sh $1 consul 1.10.3 linux arm64
./scripts/install-hashi-binary.sh $1 vault 1.8.4 linux arm64
./scripts/install-hashi-binary.sh $1 consul-template 0.27.1 linux arm64

./scripts/setup-one-time-config-boilerplate.sh $1 consul
./scripts/setup-one-time-config-boilerplate.sh $1 vault
# Note Consul-Template does not have any auto-complete functionality and that will error out
./scripts/setup-one-time-config-boilerplate.sh $1 consul-template
./scripts/install-env-vars-script.sh $1


## MINIMAL VAULT CLIENT SETUP (FOR CERTIFICATE GENERATION AND HANDLING)
# provision templates, config files, and scripts for Vault client such that Consul and Consul-Template can communicate with the Vault cluster
./vault/scripts/provision-client-config.sh $1
./vault/scripts/provision-client-tls.sh $1

# build vault cert-gen infrastructure
# FIXME :: there should be a neato, baller script here that generates a Vault and Consul cli certificate and installs it on the target
./vault/scripts/install-client-cert-gen-service.sh $1


## CONSUL SERVER SETUP
# provision templates, config files, and scripts for Consul-Template to generate Consul's service configuration 
consul/scripts/provision-server-config.sh $1
consul/scripts/provision-gossip-config.sh $1
consul/scripts/provision-server-tls.sh $1
consul/scripts/provision-token.sh $1

# install consul agent systemd services
consul/scripts/install-agent-systemd.sh $1

# generate configurations
consul/scripts/build-server-config.sh $1
consul/scripts/build-config-gossip.sh $1
consul/scripts/build-server-config-tls.sh $1

# Install certificate generation systemd service
consul/scripts/install-server-cert-gen-service.sh $1
