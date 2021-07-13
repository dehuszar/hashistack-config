#!/usr/bin/env bash

# envs
ansible $1 -b -a "rm /etc/envs/.env-vault-no-tls" $2
ansible $1 -b -m copy -a "src=envs/.env-aws dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-aws-vault dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-base dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-vault-base dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-vault-tls-client dest=/etc/envs/" $2

# templates
ansible $1 -b -m copy -a "src=vault/consul-template/certificates/cli/ dest=/etc/consul-template.d/certificates/vault" $2
ansible $1 -b -m copy -a "src=vault/consul-template/certificates/client/ dest=/etc/consul-template.d/certificates/vault" $2
