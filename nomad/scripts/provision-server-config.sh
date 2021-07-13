#!/usr/bin/env bash

# envs
ansible $1 -b -m copy -a "src=envs/build-env-vars dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-base dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-nomad-acl dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-nomad-base dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-nomad-plugins dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-nomad-server dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-nomad-telemetry dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-nomad-tls-server dest=/etc/envs/" $2

# service
ansible $1 -b -m copy -a "src=nomad/nomad.service dest=/etc/systemd/system/" $2

# templates
ansible $1 -b -m copy -a "src=nomad/consul-template/configurations/base/ dest=/etc/consul-template.d/configurations/nomad/" $2
ansible $1 -b -m copy -a "src=nomad/consul-template/configurations/server/ dest=/etc/consul-template.d/configurations/nomad/" $2

# resetting permissions
ansible $1 -b -a "sudo chown nomad:nomad /etc/consul-template.d -R" $2
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/configurations/nomad/build-server-config-tls.sh" $2
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/configurations/nomad/build-server-config-no-tls.sh" $2
