ansible nomad-servers -a "sudo openssl x509 -in /etc/certs/nomad-server-agent.crt -noout -enddate"
ansible nomad-servers -b -a "sudo systemctl status nomad-server-cert-gen.timer"
ansible nomad-servers -b -a "sudo systemctl restart nomad-server-cert-gen.timer"
ansible nomad-servers -b -a "sudo systemctl restart nomad-server-cert-gen.service"

ansible all -a "sudo openssl x509 -in /etc/certs/consul-cli.crt -noout -enddate" --ask-become-pass
ansible all -a "sudo openssl x509 -in /etc/certs/vault-cli.crt -noout -enddate" --ask-become-pass

ansible vault-servers -a "sudo openssl x509 -in /etc/certs/vault-server-agent.crt -noout -enddate"
ansible vault-servers -b -a "sudo systemctl status vault-server-cert-gen.timer"
ansible vault-servers -b -a "sudo systemctl restart vault-server-cert-gen.timer"
ansible vault-servers -b -a "sudo systemctl restart vault-server-cert-gen.service"

ansible consul-servers -a "sudo openssl x509 -in /etc/certs/consul-server-agent.crt -noout -enddate"
ansible consul-servers -b -a "sudo systemctl status consul-server-cert-gen.timer"
ansible consul-servers -b -a "sudo systemctl restart consul-server-cert-gen.timer"
ansible consul-servers -b -a "sudo systemctl restart consul-server-cert-gen.service"