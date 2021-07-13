#!/usr/bin/env bash

source /etc/envs/build-env-vars

CONSUL_DATACENTER=$CONSUL_DATACENTER \
    DOMAIN=$DOMAIN \
    VAULT_ADDR=$VAULT_ADDR \
    VAULT_TOKEN=$VAULT_TOKEN \
    VAULT_CACERT=$VAULT_CACERT \
    VAULT_CLIENT_CERT=$VAULT_CLIENT_CERT \
    VAULT_CLIENT_KEY=$VAULT_CLIENT_KEY \
        consul-template -config /etc/consul-template.d/certificates/vault/update-client-cert-gen-service.hcl -log-level=debug -once
