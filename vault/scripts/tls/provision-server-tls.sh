#!/usr/bin/env bash

# remove any conflicting envs
ansible $1 -b -a "rm /etc/envs/.env-vault-no-tls"

# aws envs should get moved out to it's own provisioner script and caveated with advice around
# using instance profiles rather than cred on the instance
ansible $1 -b -m copy -a "src=envs/.env-aws dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-aws-vault dest=/etc/envs/"

# envs
ansible $1 -b -m copy -a "src=envs/.env-base dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-vault-base dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-vault-tls-server dest=/etc/envs/"

# templates
ansible $1 -b -m copy -a "src=vault/consul-template/certificates/cli/ dest=/etc/consul-template.d/certificates/vault"
ansible $1 -b -m copy -a "src=vault/consul-template/certificates/server/ dest=/etc/consul-template.d/certificates/vault"

# execute permissions
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/certificates/vault/build-server-cert-gen-templates.sh"
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/certificates/vault/build-server-certs.sh"
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/certificates/vault/update-server-cert-gen-systemd-service.sh"
