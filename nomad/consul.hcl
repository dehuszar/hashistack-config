consul {
  address = "127.0.0.1:8501"
  ca_file = "/etc/nomad.d/keys/consul-agent-ca.pem"
  cert_file = "/etc/nomad.d/keys/home-cli-consul-0.pem"
  key_file = "/etc/nomad.d/keys/home-cli-consul-0-key.pem"
  ssl = true
  // traefik tags are for terminating SSL for UI access
  tags = [
    "traefik.enable=true",
    "traefik.http.routers.nomad.entrypoints=websecure",
    "traefik.http.routers.nomad.rule=Host(`nomad-ui.mydomain.com`)",
    "traefik.http.routers.nomad.service=nomad",
    "traefik.http.routers.nomad.tls.domains[0].main=mydomain.com",
    "traefik.http.routers.nomad.tls.domains[0].sans=*.mydomain.com",
    "traefik.http.routers.nomad.tls=true",
    "traefik.http.services.nomad.loadbalancer.healthcheck.hostname=nomad-ui.mydomain.com",
    "traefik.http.services.nomad.loadbalancer.healthcheck.interval=10",
    "traefik.http.services.nomad.loadbalancer.healthcheck.port=443",
    "traefik.http.services.nomad.loadbalancer.healthcheck.scheme=https",
    "traefik.http.services.nomad.loadbalancer.healthcheck.timeout=10"
    "traefik.http.services.nomad.loadbalancer.passhostheader=true",
    "traefik.http.services.nomad.loadbalancer.server.port=4646",
    "traefik.http.services.nomad.loadbalancer.server.scheme=https",
  ]
}