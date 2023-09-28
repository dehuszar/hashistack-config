#!/usr/bin/env bash

source /etc/envs/build-env-vars

# Check for token existence before generating a new one
if [[ -z "${VAULT_TOKEN}" ]]; then
read client_token < <(echo $(vault login -method=oidc -format=json | jq -r '.auth.client_token'))
export VAULT_TOKEN=$client_token
fi

sudo DOMAIN=$DOMAIN \
    CONSUL_DATACENTER=$CONSUL_DATACENTER \
    VAULT_ADDR=$VAULT_ADDR \
    VAULT_TOKEN=$VAULT_TOKEN \
    consul-template \
        -config /etc/consul-template.d/certificates/consul/build-browser-certs.hcl \
        -once
        