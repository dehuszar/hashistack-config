[Unit]
Description=Bi-weekly-ish cert rotation service

[Service]
User=root
Group=root
EnvironmentFile="/etc/systemd/system/vault-server-cert-gen.d/vault-server-cert-gen.service.conf"
ExecStart=/bin/bash -c "sudo bash /etc/consul-template.d/certificates/vault/build-server-certs.sh $VAULT_ADDR"