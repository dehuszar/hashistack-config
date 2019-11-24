// opting for the new vault storage option, and not linking to an external consul cluster
storage "raft" {
  path    = "/opt/vault/"
  node_id = "node1"
}

listener "tcp" {
  address     = "{{ GetInterfaceIP \"eth0\" }}:8200"
  tls_disable = 1
}

api_addr     = "https://{{ GetInterfaceIP \"eth0\" }}:8200"
cluster_addr = "https://{{ GetInterfaceIP \"eth0\" }}:8201"
disable_mlock = true
ui=true
