// opting for the new vault storage option, and not linking to an external consul cluster
storage "raft" {
  path    = "/opt/vault/"
  node_id = "node1"
}

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = 1
}

// duplicate the contents of the above listener with the resolvable ip address
// of the node to be able to access the ui from the local network
// listener "tcp" {
//   address     = "127.0.0.1:8200"
//   tls_disable = 1
// }

api_addr     = "https://127.0.0.1:8200"
cluster_addr = "https://127.0.0.1:8201"
disable_mlock = true
ui=true
