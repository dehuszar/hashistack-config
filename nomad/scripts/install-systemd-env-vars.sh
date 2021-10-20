#!/usr/bin/env bash

# create EnvironmentFile for service based on deployed env vars
ansible $1 -b -a "sudo bash /etc/consul-template.d/configurations/nomad/build-systemd-env-vars.sh"