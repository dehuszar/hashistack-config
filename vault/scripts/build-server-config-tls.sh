#!/usr/bin/env bash

ansible $1 -b -a "sudo /etc/consul-template.d/configurations/vault/build-server-config-tls.sh" $2