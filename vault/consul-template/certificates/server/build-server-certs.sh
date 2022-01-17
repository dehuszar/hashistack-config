#!/usr/bin/env bash

source /etc/envs/build-env-vars

sudo DOMAIN=$DOMAIN \
    CONSUL_DATACENTER=$CONSUL_DATACENTER \
    VAULT_TOKEN=$VAULT_TOKEN \
    consul-template \
        -config /etc/consul-template.d/certificates/vault/build-server-certs.hcl -vault-addr $VAULT_ADDR \
        -once

sudo ln -s /etc/certs/vault-ca.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
