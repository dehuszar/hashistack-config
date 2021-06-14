[Unit]
Description=Bi-weekly-ish cert rotation service

[Service]
User=root
Group=root
EnvironmentFile={{ or ( env "NOMAD_SERVER_CERT_GEN_TIMER_PERSISTENT" ) "/etc/systemd/system/nomad-server-cert-gen.d/nomad-server-cert-gen.service.conf" }}
ExecStart=/bin/bash -c "sudo bash /etc/consul-template.d/certificates/nomad/build-nomad-server-certs.sh"