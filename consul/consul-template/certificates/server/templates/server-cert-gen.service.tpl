[Unit]
Description=Bi-weekly-ish cert rotation service

[Service]
User=root
Group=root
EnvironmentFile={{ or ( env "CONSUL_SERVER_CERT_GEN_TIMER_PERSISTENT" ) "/etc/systemd/system/consul-server-cert-gen.d/consul-server-cert-gen.service.conf" }}
ExecStart=/bin/bash -c "sudo bash /etc/consul-template.d/certificates/consul/build-server-certs.sh"