#!/usr/bin/env bash

# envs
ansible $1 -b -a "rm /etc/envs/.env-vault-no-tls" $2
ansible $1 -b -m copy -a "src=envs/.env-aws dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-aws-vault dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-base dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-vault-base dest=/etc/envs/" $2
ansible $1 -b -m copy -a "src=envs/.env-vault-tls-client dest=/etc/envs/" $2

# templates
ansible $1 -b -m copy -a "src=vault/tls/consul-template/cli/ dest=/etc/consul-template.d/certificates/vault" $2
ansible $1 -b -m copy -a "src=vault/tls/consul-template/client/ dest=/etc/consul-template.d/certificates/vault" $2

# execute permissions
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/certificates/vault/build-client-cert-gen-templates.sh"
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/certificates/vault/build-client-certs.sh"
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/certificates/vault/update-client-cert-gen-systemd-service.sh"