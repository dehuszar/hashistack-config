#!/usr/bin/env bash

source /etc/envs/build-env-vars

sudo DOMAIN=$DOMAIN \
    CONSUL_DATACENTER=$CONSUL_DATACENTER \
    VAULT_ADDR=$VAULT_ADDR \
    VAULT_TOKEN=$VAULT_TOKEN \
    consul-template \
        -config /etc/consul-template.d/certificates/consul/build-consul-server-certs.hcl \
        -once

sudo ln -s /etc/certs/consul-ca.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
