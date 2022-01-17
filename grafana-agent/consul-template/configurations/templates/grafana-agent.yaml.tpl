{{ $nodeName := env "CONSUL_NODE_NAME" }}
{{ $isNomadClient := printf "/nodes/%s/IS_NOMAD_CLIENT" $nodeName }}
{{ $isNomadServer := printf "/nodes/%s/IS_NOMAD_SERVER" $nodeName }}
{{ $isVaultServer := printf "/nodes/%s/IS_VAULT_SERVER" $nodeName }}
{{ $isDNSServer := printf "/nodes/%s/IS_DNS_SERVER" $nodeName }}
server:
  log_level: {{ keyOrDefault "services/grafana-cloud/SERVER_LOG_LEVEL" "info" }}
  http_listen_port: {{ keyOrDefault "services/grafana-cloud/SERVER_HTTP_LISTEN_PORT" "12345" }}

metrics:
  wal_directory: {{ keyOrDefault "services/grafana-cloud/METRICS_WAL_DIRECTORY" "/tmp/grafana-agent-wal" }}
  global:
    scrape_interval: {{ keyOrDefault "services/grafana-cloud/METRICS_GLOBAL_SCRAPE_INTERVAL" "60s"}}
    remote_write:
      - basic_auth: {{ with secret "secret/services/grafana-cloud" }}
          username: {{ .Data.data.METRICS_REMOTE_WRITE_BASIC_AUTH_USERNAME }}
          password: {{ .Data.data.METRICS_REMOTE_WRITE_BASIC_AUTH_PASSWORD }}{{ end }}
        url: {{ keyOrDefault "services/grafana-cloud/METRICS_GLOBAL_REMOTE_WRITE_URL" "https://prometheus-us-central1.grafana.net/api/prom/push" }}
        write_relabel_configs:
        - source_labels: {{ keyOrDefault "services/grafana-cloud/METRICS_REMOTE_WRITE_WRITE_LABEL_CONFIGS_SOURCE_LABELS" "[__name__]" }}
          regex: {{ key "services/grafana-cloud/METRICS_REMOTE_WRITE_WRITE_LABEL_CONFIGS_REGEX" }}
          action: {{ keyOrDefault "services/grafana-cloud/METRICS_REMOTE_WRITE_WRITE_LABEL_CONFIGS_ACTION" "keep" }}

  configs:
    - name: integrations
      scrape_configs:
      # all nodes are Consul Clients
      - job_name: integrations/consul
        metrics_path: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_CONSUL_METRICS_PATH" "/v1/agent/metrics" }}
        params:
          format:
            - prometheus
        scheme: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_CONSUL_SCHEME" "https"}}
        scrape_interval: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_CONSUL_SCRAPE_INTERVAL" "60s"}}
        static_configs:
          - targets:
            - localhost:8501
            labels:
              datacenter: "home"
              job: "consul_agents"
              host: {{ env "HOSTNAME" }}
              instance: {{ env "HOSTNAME" }}
              node: {{ env "CONSUL_NODE_NAME" }}
        tls_config:
          ca_file: {{ env "CONSUL_CACERT" }}
          cert_file: {{ env "CONSUL_CLIENT_CERT" }}
          key_file: {{ env "CONSUL_CLIENT_KEY" }}
          server_name: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_CONSUL_SD_CONFIG_SERVER_NAME" "localhost" }}
          insecure_skip_verify: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_CONSUL_SD_CONFIG_INSECURE_SKIP_VERIFY" "false" }}
      {{ if keyExists ( or $isNomadClient $isNomadServer ) }}
      # if Nomad Client or Server
      - job_name: integrations/nomad
        # relabel_configs:
        # - source_labels: ['__meta_consul_tags']
        #   regex: '(.*)http(.*)'
        #   action: keep
        metrics_path: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_NOMAD_METRICS_PATH" "/v1/metrics" }}
        params:
          format:
            - prometheus
        scheme: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_CONSUL_SCHEME" "https"}}
        scrape_interval: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_NOMAD_SCRAPE_INTERVAL" "60s"}}
        static_configs:
          - targets: 
            - localhost:4646
            labels:
              datacenter: "home"
              job: "nomad_agents"
              host: {{ env "HOSTNAME" }}
              instance: {{ env "HOSTNAME" }}
              node: {{ env "CONSUL_NODE_NAME" }}
        tls_config:
          ca_file: {{ env "NOMAD_CACERT" }}
          cert_file: {{ env "NOMAD_CLIENT_CERT" }}
          key_file: {{ env "NOMAD_CLIENT_KEY" }}
          server_name: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_CONSUL_SD_CONFIG_SERVER_NAME" "localhost" }}
          insecure_skip_verify: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_CONSUL_SD_CONFIG_INSECURE_SKIP_VERIFY" "false" }}
      {{ end }}
      {{ if keyExists $isVaultServer }}
      # if Vault Server
      - job_name: integrations/vault
        metrics_path: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_VAULT_METRICS_PATH" "/v1/sys/metrics" }}
        params:
          format:
            - prometheus
        scheme: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_CONSUL_SCHEME" "https"}}
        scrape_interval: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_NOMAD_SCRAPE_INTERVAL" "60s"}}
        bearer_token: {{ env "VAULT_TOKEN" }}
        static_configs:
          - targets: 
            - localhost:8200
            labels:
              datacenter: "home"
              job: "vault_agents"
              host: {{ env "HOSTNAME" }}
              instance: {{ env "HOSTNAME" }}
              node: {{ env "CONSUL_NODE_NAME" }}
        tls_config:
          ca_file: {{ env "VAULT_CACERT" }}
          cert_file: {{ env "VAULT_CLIENT_CERT" }}
          key_file: {{ env "VAULT_CLIENT_KEY" }}
          server_name: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_CONSUL_SD_CONFIG_SERVER_NAME" "localhost" }}
          insecure_skip_verify: {{ keyOrDefault "services/grafana-cloud/METRICS_CONFIGS_INTEGRATIONS_SCRAPE_CONFIGS_CONSUL_SD_CONFIG_INSECURE_SKIP_VERIFY" "false" }}
      {{ end }}
      
logs:
  configs:
  - name: default
    positions:
      filename: {{ keyOrDefault "services/grafana-cloud/LOGS_CONFIGS_POSITIONS_FILENAME" "/tmp/positions.yaml" }}
    scrape_configs: {{ with $configs := key "services/grafana-cloud/LOGS_CONFIGS_DEFAULT_SCRAPE_CONFIGS" | parseJSON }}{{ range $index, $element := $configs }}
      - job_name: {{ $element.name }}
        static_configs:
          - targets: {{ $element.targets }}
            labels:
              job: {{ $element.name }}
              __path__: {{ $element.path }}{{ end }}{{ end }}
      {{ if keyExists $isNomadClient }}
      - job_name: "nomad_jobs"
        static_configs:
          - targets: [localhost]
            labels:
              job: "nomad_jobs"
              __path__: "/opt/nomad/alloc/*/alloc/logs/*"
      {{ end }}
    clients:
      - url: {{ keyOrDefault "services/grafana-cloud/LOGS_CONFIGS_DEFAULT_CLIENTS_URL" "http://logs-prod-us-central1.grafana.net/loki/api/v1/push" }}
        basic_auth: {{ with secret "secret/services/grafana-cloud" }}
          username: {{ .Data.data.LOGS_CONFIGS_DEFAULT_CLIENTS_USERNAME }}
          password: {{ .Data.data.LOGS_CONFIGS_DEFAULT_CLIENTS_PASSWORD }}{{ end }}

integrations:
  agent:
    enabled: {{ keyOrDefault "services/grafana-cloud/INTEGRATIONS_AGENT_ENABLED" "true" }}
  # consul_exporter:
  #   enabled: {{ keyOrDefault "services/grafana-cloud/INTEGRATIONS_CONSUL_EXPORTER_ENABLED" "true" }}
  #   server: {{ env "CONSUL_HTTP_ADDR" }}
  #   ca_file: {{ env "CONSUL_CACERT" }}
  #   cert_file: {{ env "CONSUL_CLIENT_CERT" }}
  #   key_file: {{ env "CONSUL_CLIENT_KEY" }}
  {{ if keyExists $isDNSServer }}
  # if HOSTNAMEe instance
  dnsmasq_exporter:
    enabled: "true"
    dnsmasq_address: {{ keyOrDefault "services/grafana-cloud/INTEGRATIONS_DNSMASQ_EXPORTER_DNSMASQ_ADDRESS" "localhost:53" }}
    leases_path: {{ keyOrDefault "services/grafana-cloud/INTEGRATIONS_DNSMASQ_EXPORTER_LEASES_PATH" "/etc/pihole/dhcp.leases" }}
  {{ end }}
  node_exporter:
    enabled: {{ keyOrDefault "services/grafana-cloud/INTEGRATIONS_NODE_EXPORTER_ENABLED" "true" }}
