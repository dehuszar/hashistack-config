client_addr        = "{{ env "CONSUL_CLIENT_ADDR" }}"
data_dir           = "{{ env "CONSUL_DATA_DIR" }}"
datacenter         = "{{ env "CONSUL_DATACENTER" }}"
primary_datacenter = "{{ env "CONSUL_PRIMARY_DATACENTER" }}"
retry_join         = ["{{ env "CONSUL_RETRY_JOIN1" }}", "{{ env "CONSUL_RETRY_JOIN2" }}", "{{ env "CONSUL_RETRY_JOIN3" }}"]

performance {
  raft_multiplier = {{ env "CONSUL_RAFT_MULTIPLIER" }}
}