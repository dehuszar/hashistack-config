#!/usr/bin/env bash

echo 'Checking Nomad server certs'
ansible ${1:-all} -a "sudo openssl x509 -in /etc/certs/nomad-server-agent.crt -noout -enddate" $2
