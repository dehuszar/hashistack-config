#!/bin/bash

source /etc/envs/build-env-vars

DOMAIN=$DOMAIN \
    CONSUL_DATACENTER=$CONSUL_DATACENTER \
    HOSTNAME=$HOSTNAME \
    VAULT_AGENT_ADDR=$VAULT_AGENT_ADDR \
    VAULT_TOKEN=$VAULT_TOKEN \
    /usr/local/bin/consul-template -config=/etc/consul-template.d/certificates/consul/build-consul-server-certs.hcl -log-level=debug -once