node "compute3" {
  policy = "write"
}

agent "compute3" {
	policy = "read"
}

service_prefix "nomad" {
	policy = "write"  
}
