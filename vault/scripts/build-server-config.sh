#!/usr/bin/env bash

ansible $1 -b -a "sudo /etc/consul-template.d/configurations/vault/build-server-config-no-tls.sh" $2
ansible $1 -b -m copy -a "src=vault/vault.service dest=/etc/systemd/system/" $2