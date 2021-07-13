client {
  enabled = {{ env "NOMAD_CLIENT_ENABLED" }}
  options = {
    driver.raw_exec.enable = "{{ env "NOMAD_OPTIONS_DRIVER_RAW_EXEC" }}"
    docker.privileged.enabled = "{{ env "NOMAD_OPTIONS_DOCKER_PRIVILEGED_ENABLED" }}"
  }
}
