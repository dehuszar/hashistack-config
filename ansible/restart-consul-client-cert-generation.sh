#!/usr/bin/env bash
# restart scripts do not provide a default value for ansible targets
ansible $1 -a "sudo systemctl restart consul-client-cert-gen.timer" $2
ansible $1 -a "sudo systemctl restart consul-client-cert-gen.service" $2