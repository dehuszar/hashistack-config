client {
  enabled = {{ env "NOMAD_CLIENT_ENABLED" }}
  options = {
    driver.raw_exec.enable = "{{ env "NOMAD_OPTIONS_DRIVER_RAW_EXEC" }}"
    docker.privileged.enabled = "{{ env "NOMAD_OPTIONS_DOCKER_PRIVILEGED_ENABLED" }}"
  }

  {{ range services }}
host_volume "{{ .Name }}" {
  path      = "{{ key "services/nomad/NOMAD_VOLUME_MOUNT_PATH" }}/{{ .Name }}"
  read_only = false
}
  {{ end }}
}
