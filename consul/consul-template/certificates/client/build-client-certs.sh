#!/usr/bin/env bash

source /etc/envs/build-env-vars

sudo DOMAIN=$DOMAIN \
    CONSUL_DATACENTER=$CONSUL_DATACENTER \
    VAULT_ADDR=$VAULT_ADDR \
    VAULT_TOKEN=$VAULT_TOKEN \
    /usr/local/bin/consul-template -config=/etc/consul-template.d/certificates/consul/build-client-certs.hcl -log-level=debug -once

sudo ln -s /etc/certs/consul-ca.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
