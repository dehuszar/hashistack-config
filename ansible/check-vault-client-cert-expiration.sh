#!/usr/bin/env bash

echo 'Checking Vault client certs'
ansible ${1:-all} -a "sudo openssl x509 -in /etc/certs/vault-cli.crt -noout -enddate" $2