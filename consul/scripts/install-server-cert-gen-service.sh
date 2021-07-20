#!/usr/bin/env bash

# create EnvironmentFile for service based on deployed env vars
ansible $1 -b -a "sudo bash /etc/consul-template.d/certificates/consul/build-server-cert-gen-templates.sh"

# install certificate generation service
ansible $1 -b -a "sudo bash /etc/consul-template.d/certificates/consul/update-server-cert-gen-systemd-service.sh"
