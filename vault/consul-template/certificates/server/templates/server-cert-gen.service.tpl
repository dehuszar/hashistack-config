[Unit]
Description=Bi-weekly-ish cert rotation service

[Service]
User=root
Group=root
EnvironmentFile={{ or ( env "VAULT_SERVER_CERT_GEN_TIMER_PERSISTENT" ) "/etc/systemd/system/vault-server-cert-gen.d/vault-server-cert-gen.service.conf" }}
ExecStart=/bin/bash -c "sudo bash /etc/consul-template.d/certificates/vault/build-vault-server-certs.sh"