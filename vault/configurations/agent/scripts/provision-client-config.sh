#!/usr/bin/env bash

# envs
ansible $1 -b -m copy -a "src=envs/.env-aws dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-aws-vault dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-base dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-vault-base dest=/etc/envs/"
ansible $1 -b -m copy -a "src=envs/.env-vault-tls-client dest=/etc/envs/"
