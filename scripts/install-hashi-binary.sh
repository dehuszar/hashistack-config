#!/usr/bin/env bash

# $1 = ansible host
# $2 = binary name; i.e. consul, vault, nomad, etc
# $3 = binary version; i.e 1.0.8
# $4 = target os; linux, darwin, windows, etc
# $5 = target arch; amd64, arm64, armhf, etc

ansible $1 -b -a "wget --output-document=$2.zip https://releases.hashicorp.com/$2/$3/$2_$3_$4_$5.zip"

ansible $1 -b -a "unzip $2.zip"
ansible $1 -b -a "sudo mv $2 /usr/local/bin" --ask-become-pass
ansible $1 -b -a "rm $2.zip"