#!/usr/bin/env bash
ansible $1 -b -a "sudo mkdir -p /etc/envs" $2
ansible $1 -b -m copy -a "src=envs/build-env-vars dest=/etc/envs/" $2