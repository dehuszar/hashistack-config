#!/usr/bin/env bash

ansible $1 -b -a "rm /etc/envs/.env-vault-tls*"
ansible $1 -b -m copy -a "src=envs/.env-vault-no-tls dest=/etc/envs/"
