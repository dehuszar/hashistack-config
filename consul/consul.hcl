client_addr = "0.0.0.0"
data_dir = "/opt/consul"
datacenter = "home"
primary_datacenter = "home"
retry_join = ["network1", "network2", "network3"]

performance {
  raft_multiplier = 1
}