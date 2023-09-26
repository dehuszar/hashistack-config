#!/usr/bin/env bash
# restart scripts do not provide a default value for ansible targets
ansible $1 -a "sudo systemctl restart nomad.service" $2