[Unit]
Description=Bi-weekly-ish cert rotation service

[Service]
User=root
Group=root
EnvironmentFile={{ or ( env "NOMAD_CLIENT_CERT_GEN_TIMER_PERSISTENT" ) "/etc/systemd/system/nomad-client-cert-gen.d/nomad-client-cert-gen.service.conf" }}
ExecStart=/bin/bash -c "sudo bash /etc/consul-template.d/certificates/nomad/build-client-certs.sh"