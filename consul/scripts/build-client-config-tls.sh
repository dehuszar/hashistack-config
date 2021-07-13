#!/usr/bin/env bash

ansible $1 -b -a "sudo /etc/consul-template.d/configurations/consul/build-client-config-tls.sh" $2