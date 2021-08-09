#!/usr/bin/env bash

# Install binaries and prep configurations
# $1 = target host
# $2 = binary name; consul, vault, nomad

echo "creating $2 user and config folders"
ansible $1 -b -a "sudo mkdir --parents /opt/$2" --ask-become-pass
ansible $1 -b -a "sudo mkdir --parents /etc/$2.d" --ask-become-pass
ansible $1 -b -a "sudo useradd --system --home /etc/$2.d --shell /bin/false $2" --ask-become-pass
ansible $1 -b -a "chmod 700 /etc/$2.d/"
ansible $1 -b -a "sudo chown --recursive $2:$2 /opt/$2 /etc/$2.d" --ask-become-pass

echo "setting up $2 autocomplete"
ansible $1 -b -a "$2 -autocomplete-install"
ansible $1 -b -a "complete -C /usr/local/bin/$2 $2"
