#!/usr/bin/env bash
echo "copying files/folders to targets"
ansible $1 -m copy -b -a "src=grafana-agent/consul-template/configurations/ dest=/etc/consul-template.d/configurations/grafana-agent" $2
ansible $1 -m copy -b -a "src=grafana-agent/grafana-agent.service dest=/etc/systemd/system" $2
ansible $1 -m copy -b -a "src=grafana-agent/grafana-agent-updater.service dest=/etc/systemd/system" $2

echo "creating grafana-agent user and adding groups"
ansible $1 -b -a "sudo useradd --no-create-home --shell /bin/false grafana-agent" $2
ansible $1 -b -a "sudo usermod -a -G adm,nomad grafana-agent" $2

echo "enabling and starting systemd tasks"
ansible $1 -b -a "sudo systemctl daemon-reload" $2
ansible $1 -b -a "sudo systemctl enable grafana-agent.service" $2
ansible $1 -b -a "sudo systemctl enable grafana-agent-updater.service" $2
ansible $1 -b -a "sudo systemctl restart grafana-agent.service" $2
ansible $1 -b -a "sudo systemctl restart grafana-agent-updater.service" $2

echo "making grafana-agent config builder executable"
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/configurations/grafana-agent/build-grafana-agent-config.sh" $2
