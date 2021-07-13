telemetry {
  collection_interval = "{{ env "NOMAD_TELEMETRY_COLLECTION_INTERVAL" }}"
  disable_hostname = {{ env "NOMAD_TELEMETRY_DISABLE_HOSTNAME" }}
  prometheus_metrics = {{ env "NOMAD_TELEMETRY_PROMETHEUS_METRICS" }}
  publish_allocation_metrics = {{ env "NOMAD_TELEMETRY_PUBLISH_ALLOCATION_METRICS" }}
  publish_node_metrics = {{ env "NOMAD_TELEMETRY_PUBLISH_NODE_METRICS" }}
}
