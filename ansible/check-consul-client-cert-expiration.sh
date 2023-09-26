#!/usr/bin/env bash

echo 'Checking Consul client certs'
ansible ${1:-all} -a "sudo openssl x509 -in /etc/certs/consul-cli.crt -noout -enddate" $2