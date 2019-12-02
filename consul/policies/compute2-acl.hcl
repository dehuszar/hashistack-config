node "compute2" {
  policy = "write"
}

agent "compute2" {
	policy = "read"
}

service_prefix "nomad" {
	policy = "write"  
}
