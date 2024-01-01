plugin "docker" {
    config {
        volumes {
            enabled = {{ env "NOMAD_PLUGIN_DOCKER_CONFIG_VOLUMES_ENABLED" }}
        }
    }
}