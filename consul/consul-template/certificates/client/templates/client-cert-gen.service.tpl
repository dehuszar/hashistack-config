[Unit]
Description=Bi-weekly-ish cert rotation service

[Service]
User=root
Group=root
EnvironmentFile={{ or ( env "CONSUL_CLIENT_CERT_GEN_TIMER_PERSISTENT" ) "/etc/systemd/system/consul-client-cert-gen.d/consul-client-cert-gen.service.conf" }}
ExecStart=/bin/bash -c "/usr/local/bin/consul-template -config=/etc/consul-template.d/certificates/consul/build-consul-client-certs.hcl -log-level=debug -once"