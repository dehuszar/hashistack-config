#!/usr/bin/env bash

# envs
ansible $1 -b -m copy -a "src=envs/.env-aws dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-aws-vault dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-base dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-vault-base dest=/etc/envs/"

# templates
ansible $1 -b -m copy -a "src=vault/consul-template/configurations/server/ dest=/etc/consul-template.d/configurations/vault"

ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/configurations/vault/build-integration-config.sh"
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/configurations/vault/build-server-config-no-tls.sh"
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/configurations/vault/build-server-config-tls.sh"