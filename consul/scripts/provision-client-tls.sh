
#!/usr/bin/env bash

# envs
ansible $1 -b -a "rm /etc/envs/.env-consul-no-tls" $2
ansible $1 -b -m copy -a "src=envs/.env-consul-tls-client-agent dest=/etc/envs/" $2

# templates
ansible $1 -b -m copy -a "src=consul/consul-template/certificates/cli/ dest=/etc/consul-template.d/certificates/consul/" $2
ansible $1 -b -m copy -a "src=consul/consul-template/certificates/client/ dest=/etc/consul-template.d/certificates/consul/" $2

# resetting permissions
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/certificates/consul/build-client-certs.sh" $2
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/certificates/consul/build-client-cert-gen-templates.sh" $2
ansible $1 -b -a "sudo chmod +x /etc/consul-template.d/certificates/consul/update-client-cert-gen-systemd-service.sh" $2

ansible $1 -b -a "sudo mkdir -p /etc/certs" $2
