#!/bin/bash

source /etc/envs/build-env-vars

DOMAIN=$DOMAIN \
    CONSUL_DATACENTER=$CONSUL_DATACENTER \
    VAULT_TOKEN=$VAULT_TOKEN \
    /usr/local/bin/consul-template -config=/etc/consul-template.d/certificates/consul/build-consul-client-certs.hcl -vault-addr "https://vault.service.consul:8200" -log-level=debug -once