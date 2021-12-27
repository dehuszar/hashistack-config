server:
  log_level: {{ keyOrDefault "services/grafana-cloud/SERVER_LOG_LEVEL" "info" }}
  http_listen_port: {{ keyOrDefault "services/grafana-cloud/SERVER_HTTP_LISTEN_PORT" "12345" }}

metrics:
  wal_directory: {{ keyOrDefault "services/grafana-cloud/METRICS_WAL_DIRECTORY" "/tmp/grafana-agent-wal"}}
  global:
    scrape_interval: {{ keyOrDefault "services/grafana-cloud/METRICS_GLOBAL_SCRAPE_INTERVAL" "60s"}}
    remote_write:
      - basic_auth:
          password: {{ secret "services/grafana-cloud" "METRICS_REMOTE_WRITE_BASIC_AUTH_PASSWORD" }}
          username: {{ secret "services/grafana-cloud" "METRICS_REMOTE_WRITE_BASIC_AUTH_USERNAME" }}
        url: {{ keyOrDefault "services/grafana-cloud/METRICS_GLOBAL_REMOTE_WRITE_URL" "https://prometheus-us-central1.grafana.net/api/prom/push" }}
        write_relabel_configs:
        - source_labels: {{ keyOrDefault "services/grafana-cloud/METRICS_REMOTE_WRITE_WRITE_LABEL_CONFIGS_SOURCE_LABELS" "[__name__]" }}
          regex: {{ key "services/grafana-cloud/METRICS_REMOTE_WRITE_WRITE_LABEL_CONFIGS_REGEX" }}
          action: {{ keyOrDefault "services/grafana-cloud/METRICS_REMOTE_WRITE_WRITE_LABEL_CONFIGS_ACTION" "keep" }}
  configs:
    - name: integrations
      scrape_configs:
      {{ with node }}
      {{ define "isNomadClient" }}/nodes/{{ Node.Name }}/IS_NOMAD_CLIENT{{ end }}
      {{ define "isNomadServer" }}/nodes/{{ Node.Name }}/IS_NOMAD_SERVER{{ end }}
      {{ define "isVaultServer" }}/nodes/{{ Node.Name }}/IS_VAULT_SERVER{{ end }}
      # all nodes are Consul Clients
      - job_name: integrations/consul
        server: {{ keyOrDefault "services/consul/CONSUL_HTTP_ADDR" "https://localhost:8501" }}
        ca_file: {{ key "services/consul/CONSUL_CACERT" }}
        cert_file: {{ key "services/consul/client/CONSUL_CLIENT_CERT" }}
        key_file: {{ key "services/consul/client/CONSUL_CLIENT_KEY" }}
      # if Nomad Client or Server
      {{ if key ( or isNomadClient isNomadServer ) }}
      - job_name: integrations/nomad
        metrics_path: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_NOMAD_METRICS_PATH" "/v1/metrics?format=prometheus" }}
        static_configs:
        - targets: [{{ keyOrDefault "services/nomad/NOMAD_ADDR"}}]
      {{ end }}
      # if Vault Server
      {{ if key isVaultServer }}
      - job_name: integrations/vault
        static_configs:
        - targets: [ {{ keyOrDefault "services/vault/VAULT_ADDR"}} ]
      {{ end }}
      {{ end }}

logs:
  configs:
  - name: default
    positions:
      filename: {{ keyOrDefault "services/grafana-cloud/LOGS_CONFIGS_POSITIONS_FILENAME" "/tmp/positions.yaml" }}
    scrape_configs:
      {{ range $i := loop key "services/grafana-cloud/LOGS_CONFIGS_DEFAULT_SCRAPE_CONFIGS" | parseJSON }}
      - job_name: {{ $i.name }}
        static_configs:
          - targets: {{ $i.targets }}
            labels:
              job: {{ $i.name }}
              __path__: {{ $i.path }}
      {{ end }}
    clients:
      - url: {{ keyOrDefault "services/grafana-cloud/LOGS_CONFIGS_DEFAULT_CLIENTS_URL" "http://logs-prod-us-central1.grafana.net/loki/api/v1/push" }}
        basic_auth:
          username: {{ keyOrDefault "services/grafana-cloud/LOGS_CONFIGS_DEFAULT_CLIENTS_USERNAME" }}
          password: {{ keyOrDefault "services/grafana-cloud/LOGS_CONFIGS_DEFAULT_CLIENTS_PASSWORD" }}

integrations:
  {{ with node }}
  {{ define "isDNSServer" }}/nodes/{{ Node.Name }}/IS_DNS_SERVER{{ end }}
  agent:
    enabled: {{ keyOrDefault "services/grafana-cloud/INTEGRATIONS_AGENT_ENABLED" true }}
  consul_exporter:
    enabled: {{ keyOrDefault "services/grafana-cloud/INTEGRATIONS_CONSUL_EXPORTER_ENABLED" true }}
  # if PiHole instance
  {{ if key isDNSServer }}
  dnsmasq_exporter:
    enabled: true
    dnsmasq_address: {{ keyOrDefault "services/grafana-cloud/INTEGRATIONS_DNSMASQ_EXPORTER_DNSMASQ_ADDRESS" "localhost:53" }}
    leases_path: {{ keyOrDefault "services/grafana-cloud/INTEGRATIONS_DNSMASQ_EXPORTER_LEASES_PATH" "/etc/pihole/dhcp.leases" }}
  {{ end }}
  node_exporter:
    enabled: {{ keyOrDefault "services/grafana-cloud/INTEGRATIONS_NODE_EXPORTER_ENABLED" true }}
  {{ end }}
