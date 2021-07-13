#!/usr/bin/env bash

# envs
ansible $1 -b -a "rm /etc/envs/.env-consul-no-tls"
ansible $1 -b -m copy -a "src=envs/.env-consul-tls-server-agent dest=/etc/envs/"

# templates
ansible $1 -b -m copy -a "src=consul/consul-template/certificates/cli/ dest=/etc/consul-template.d/certificates/consul"
ansible $1 -b -m copy -a "src=consul/consul-template/certificates/server/ dest=/etc/consul-template.d/certificates/consul"
