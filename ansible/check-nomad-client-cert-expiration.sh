#!/usr/bin/env bash

echo 'Checking Nomad client certs'
ansible ${1:-all} -a "sudo openssl x509 -in /etc/certs/nomad-cli.crt -noout -enddate" $2