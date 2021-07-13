#!/usr/bin/env bash

source /etc/envs/build-env-vars

CONSUL_DATACENTER=$CONSUL_DATACENTER \
    DOMAIN=$DOMAIN \
    HOSTNAME=$HOSTNAME \
    VAULT_ADDR=$VAULT_ADDR \
    VAULT_TOKEN=$VAULT_TOKEN \
    consul-template -config /etc/consul-template.d/certificates/nomad/update-server-cert-gen-service.hcl -log-level=debug -once
    