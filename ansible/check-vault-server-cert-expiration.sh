#!/usr/bin/env bash

echo 'Checking Vault server certs'
ansible ${1:-all} -a "sudo openssl x509 -in /etc/certs/vault-server-agent.crt -noout -enddate" $2
