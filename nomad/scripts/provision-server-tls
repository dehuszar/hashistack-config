#!/usr/bin/env bash

# remove any conflicting envs
ansible $1 -b -a "rm /etc/envs/.env-nomad-no-tls"

# envs
ansible $1 -b -m copy -a "src=envs/.env-base dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-consul-tls-client-agent dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-nomad-acl dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-nomad-base dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-nomad-plugins dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-nomad-server dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-nomad-telemetry dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-nomad-tls-server dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-vault-tls-client dest=/etc/envs/"

# templates
ansible $1 -b -m copy -a "src=nomad/consul-template/certificates/cli/ dest=/etc/consul-template.d/certificates/nomad/"
ansible $1 -b -m copy -a "src=nomad/consul-template/certificates/server/ dest=/etc/consul-template.d/certificates/nomad/"

# permissions
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/certificates/nomad/build-server-certs.sh"
