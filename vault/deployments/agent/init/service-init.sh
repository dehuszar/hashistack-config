#!/usr/bin/env bash
echo "creating vault user and config folders"
ansible $1 -b -a "sudo mkdir --parents /opt/vault" $2
ansible $1 -b -a "sudo mkdir --parents /etc/vault.d" $2
ansible $1 -b -a "sudo useradd --system --home /etc/vault.d --shell /bin/false vault" $2
ansible $1 -b -a "chmod 700 /etc/vault.d/" $2
ansible $1 -b -a "sudo chown --recursive vault:vault /opt/vault /etc/vault.d" $2

echo "setting up vault autocomplete"
ansible $1 -b -a "vault -autocomplete-install" $2
ansible $1 -b -a "complete -C /usr/local/bin/vault vault" $2
