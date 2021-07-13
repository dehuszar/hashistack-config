#!/usr/bin/env bash

# The $2 args are intended to be for passing in --ask-become-pass flags as needed
ansible $1 -b -m copy -a "src=envs/.env-consul-gossip dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=consul/consul-template/configurations/gossip/ dest=/etc/consul-template.d/configurations/consul" $2

ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/configurations/consul/build-gossip-config.sh" $2
