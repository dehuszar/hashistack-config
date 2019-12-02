node "compute1" {
  policy = "write"
}

agent "compute1" {
	policy = "read"
}

service_prefix "nomad" {
	policy = "write"  
}
