#!/usr/bin/env bash

source /etc/envs/build-env-vars

DOMAIN=$DOMAIN \
    CONSUL_DATACENTER=$CONSUL_DATACENTER \
    VAULT_ADDR=$VAULT_ADDR \
    VAULT_TOKEN=$VAULT_TOKEN \
    /etc/consul-template.d/certificates/nomad/build-nomad-client-certs.hcl -log-level=debug -once