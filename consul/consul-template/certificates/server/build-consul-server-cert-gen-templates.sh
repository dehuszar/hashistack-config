#!/bin/bash
sudo CONSUL_DATACENTER=$CONSUL_DATACENTER \
DOMAIN=$DOMAIN \
HOSTNAME=$HOSTNAME \
VAULT_AGENT_ADDR=$VAULT_AGENT_ADDR \
VAULT_TOKEN=$VAULT_TOKEN \
consul-template -config /etc/consul-template.d/certificates/consul/update-server-cert-gen-service.hcl -log-level=debug -once