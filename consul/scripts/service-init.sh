#!/usr/bin/env bash
echo "creating consul user and config folders"
ansible $1 -b -a "sudo mkdir --parents /opt/consul" $2
ansible $1 -b -a "sudo mkdir --parents /etc/consul.d" $2
ansible $1 -b -a "sudo useradd --system --home /etc/consul.d --shell /bin/false consul" $2
ansible $1 -b -a "chmod 700 /etc/consul.d/" $2
ansible $1 -b -a "sudo chown --recursive consul:consul /opt/consul /etc/consul.d" $2

echo "setting up consul autocomplete"
ansible $1 -b -a "consul -autocomplete-install" $2
ansible $1 -b -a "complete -C /usr/local/bin/consul consul" $2
