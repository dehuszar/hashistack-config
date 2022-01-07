#!/usr/bin/env bash
ansible $1 -m copy -b -a "src=grafana-agent/consul-template/configurations/ dest=/etc/consul-template.d/configurations/grafana-agent" $2
ansible $1 -b -a "sudo systemctl restart grafana-agent-updater.service" $2