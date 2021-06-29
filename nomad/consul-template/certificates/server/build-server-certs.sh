#!/bin/sh

source /etc/envs/build-env-vars

DOMAIN=$DOMAIN \
CONSUL_DATACENTER=$CONSUL_DATACENTER \
VAULT_ADDR=$VAULT_ADDR \
VAULT_TOKEN=$VAULT_TOKEN \
	/usr/local/bin/consul-template -config=/etc/consul-template.d/certificates/nomad/build-server-certs.hcl -log-level=debug -once
