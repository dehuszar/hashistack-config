// opting for the new vault storage option, and not linking to an external consul cluster
storage "raft" {
  path    = "/opt/vault/"
}