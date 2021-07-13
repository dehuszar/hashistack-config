[Unit]
Description=Bi-weekly-ish cert rotation service

[Service]
User=root
Group=root
EnvironmentFile={{ or ( env "VAULT_CLIENT_CERT_GEN_TIMER_PERSISTENT" ) "/etc/systemd/system/vault-client-cert-gen.d/vault-client-cert-gen.service.conf" }}
ExecStart=/bin/bash -c "sudo bash /etc/consul-template.d/certificates/vault/build-vault-client-certs.sh"