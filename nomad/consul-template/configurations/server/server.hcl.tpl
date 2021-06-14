server {
  enabled = {{ env "NOMAD_SERVER_ENABLED" }}
  bootstrap_expect = {{ env "NOMAD_BOOTSTRAP_EXPECT" }}
}
