#!/usr/bin/env bash

ansible $1 -b -m copy -a "src=envs/.env-vault-base dest=/etc/envs/"