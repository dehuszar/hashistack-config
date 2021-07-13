#!/usr/bin/env bash

# The $2 args are intended to be for passing in --ask-become-pass flags as needed
ansible $1 -b -m copy -a "src=envs/.env-consul-token-$1 dest=/etc/envs/" $2
