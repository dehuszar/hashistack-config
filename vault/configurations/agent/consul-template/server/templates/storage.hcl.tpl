// opting for the new vault storage option, and not linking to an external consul cluster
storage "raft" {
  node_id = "{{ env "VAULT_RAFT_NODE_ID" }}"
  path    = "{{ env "VAULT_RAFT_PATH" }}"
}