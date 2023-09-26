#!/usr/bin/env bash

echo 'Checking Consul server certs'
ansible ${1:-all} -a "sudo openssl x509 -in /etc/certs/consul-server-agent.crt -noout -enddate" $2
