#!/usr/bin/env bash

ansible $1 -b -a "sudo /etc/consul-template.d/configurations/consul/build-client-config.sh" $2
ansible $1 -b -m copy -a "src=consul/consul.service dest=/etc/systemd/system/" $2