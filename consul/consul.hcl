data_dir = "/opt/consul"
datacenter = "home"
primary_datacenter = "home"

acl {
  enabled = true
  default_policy = "deny"
  down_policy = "extend-cache"
}

performance {
  raft_multiplier = 1
}