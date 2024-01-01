#!/usr/bin/env bash

# create EnvironmentFile for service based on deployed env vars
ansible $1 -b -a "sudo bash /etc/consul-template.d/certificates/nomad/build-client-cert-gen-templates.sh" $2

# install certificate generation service
ansible $1 -b -a "sudo bash /etc/consul-template.d/certificates/nomad/update-client-cert-gen-systemd-service.sh" $2
