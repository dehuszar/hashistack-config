#!/usr/bin/env bash

# set available env vars
source /etc/envs/build-env-vars

sudo CONSUL_HTTP_ADDR=$CONSUL_HTTP_ADDR \
    CONSUL_HTTP_TOKEN=$CONSUL_HTTP_TOKEN \
    VAULT_ADDR=$VAULT_ADDR \
    VAULT_TOKEN=$VAULT_TOKEN \
    consul-template \
        -config /etc/consul-template.d/configurations/nomad/build-systemd-env-vars.hcl \
        -once
