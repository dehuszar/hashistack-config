#!/usr/bin/env bash

source /etc/envs/build-env-vars

sudo CONSUL_CACERT=$CONSUL_CACERT \
CONSUL_CLIENT_CERT=$CONSUL_CLIENT_CERT \
CONSUL_CLIENT_KEY=$CONSUL_CLIENT_KEY \
CONSUL_HTTP_ADDR=$CONSUL_HTTP_ADDR \
CONSUL_HTTP_TOKEN=$CONSUL_HTTP_TOKEN \
    consul-template \
        -config /etc/consul-template.d/configurations/vault/build-integration-config.hcl \
        -once
