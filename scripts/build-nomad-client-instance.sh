# This should include every step to stand up a new Nomad client including
# setting up Consul and Vault agents, setting up the TLS certificate generation
# service

## FIRST TIME SETUP

# Note :: this needs to be a Ansible playbook, I'm just documenting steps for now
./scripts/install-hashi-binary.sh $1 consul 1.10.0 linux arm64
./scripts/install-hashi-binary.sh $1 nomad 1.1.3 linux arm64
./scripts/install-hashi-binary.sh $1 vault 1.8.1 linux arm64
./scripts/install-hashi-binary.sh $1 consul-template 0.26.0 linux arm64

./scripts/setup-one-time-config-boilerplate.sh $1 consul
./scripts/setup-one-time-config-boilerplate.sh $1 nomad
./scripts/setup-one-time-config-boilerplate.sh $1 vault
# Note Consul-Template does not have any auto-complete functionality and that will error out
./scripts/setup-one-time-config-boilerplate.sh $1 consul-template
./scripts/install-env-vars-script.sh $1


## MINIMAL VAULT CLIENT SETUP (FOR CERTIFICATE GENERATION AND HANDLING)
# provision templates, config files, and scripts for Vault client such that Consul and Consul-Template can communicate with the Vault cluster
./vault/scripts/provision-client-config.sh $1
./vault/scripts/provision-client-tls.sh $1

# build vault cert-gen infrastructure
./vault/scripts/install-client-cert-gen-service.sh $1


## CONSUL CLIENT SETUP
# provision templates, config files, and scripts for Consul-Template to generate Consul's service configuration 
consul/scripts/provision-client-config.sh $1
consul/scripts/provision-gossip-config.sh $1
consul/scripts/provision-client-tls.sh $1
consul/scripts/provision-token.sh $1
# FIXME :: there should be a neato, baller script here that generates a Vault and Consul cli certificate and installs it on the target

# install consul agent systemd services
consul/scripts/install-agent-systemd.sh $1

# generate configurations
consul/scripts/build-client-config.sh $1
consul/scripts/build-client-config-gossip.sh $1
consul/scripts/build-client-config-tls.sh $1

# Install certificate generation systemd service
consul/scripts/install-client-cert-gen-service.sh $1

## NOMAD CLIENT SETUP
# provision templates, config files, and scripts for Consul-Template to generate Nomad's service configuration 
nomad/scripts/provision-client-config.sh $1
nomad/scripts/provision-client-tls.sh $1

# install nomad agent systemd services
nomad/scripts/install-agent-systemd.sh $1

# generate configurations
nomad/scripts/build-client-config-tls.sh $1

# Install certificate generation systemd service
nomad/scripts/install-client-cert-gen-service.sh $1