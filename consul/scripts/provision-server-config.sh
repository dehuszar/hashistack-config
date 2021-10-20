#!/usr/bin/env bash

# The $2 args are intended to be for passing in --ask-become-pass flags as needed
# envs
ansible $1 -b -m copy -a "src=envs/.env-base dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-consul-acl dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-consul-base dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-consul-server dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-consul-token-$1 dest=/etc/envs/" $2

# templates
ansible $1 -b -m copy -a "src=consul/consul-template/configurations/base/ dest=/etc/consul-template.d/configurations/consul" $2
ansible $1 -b -m copy -a "src=consul/consul-template/configurations/server/ dest=/etc/consul-template.d/configurations/consul" $2

ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/configurations/consul/build-server-config.sh" $2
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/configurations/consul/build-server-config-tls.sh" $2
