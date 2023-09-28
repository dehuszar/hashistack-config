#!/usr/bin/env bash

# create /etc/certs folder in case it doesn't already exist
ansible $1 -b -a "sudo mkdir -p /etc/certs"

# create EnvironmentFile for service based on deployed env vars
ansible $1 -b -a "sudo bash /etc/consul-template.d/certificates/vault/build-server-cert-gen-templates.sh" $2

# install certificate generation service
ansible $1 -b -a "sudo bash /etc/consul-template.d/certificates/vault/update-server-cert-gen-systemd-service.sh" $2

# install vault CA into OS layer
ansible $1 -b -a "sudo ln -s /etc/certs/vault-ca.crt /usr/local/share/ca-certificates/"
ansible $1 -b -a "sudo update-ca-certificates"