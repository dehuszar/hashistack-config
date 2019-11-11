data_dir = "/opt/consul"
datacenter = "lan"
primary_datacenter = "lan"
retry_join = ["rpi1", "rpi2", "rpi3", "rpi4"]

acl {
  enabled = true
  default_policy = "deny"
  down_policy = "extend-cache"
}

performance {
  raft_multiplier = 1
}