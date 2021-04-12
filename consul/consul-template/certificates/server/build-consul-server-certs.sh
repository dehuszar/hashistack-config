#!/bin/bash

source /etc/envs/build-env-vars

DOMAIN=$DOMAIN \
    CONSUL_DATACENTER=$CONSUL_DATACENTER \
    VAULT_TOKEN=$VAULT_TOKEN \
    /usr/local/bin/consul-template -config=/etc/consul-template.d/certificates/consul/build-consul-server-certs.hcl -vault-addr "https://vault.service.vault:8200" -log-level=debug -once