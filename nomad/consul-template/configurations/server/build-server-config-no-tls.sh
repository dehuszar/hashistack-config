#!/usr/bin/env bash

source /etc/envs/build-env-vars

sudo NOMAD_ACL_ENABLED=$NOMAD_ACL_ENABLED \
        consul-template \
            -config /etc/consul-template.d/configurations/nomad/build-acl-config.hcl \
            -once

sudo CONSUL_DATACENTER=$CONSUL_DATACENTER \
    CONSUL_HTTP_TOKEN=$CONSUL_HTTP_TOKEN \
    NOMAD_DATA_DIR=$NOMAD_DATA_DIR \
    NOMAD_PLUGIN_DOCKER_CONFIG_VOLUMES_ENABLED=$NOMAD_PLUGIN_DOCKER_CONFIG_VOLUMES_ENABLED \
    NOMAD_TELEMETRY_COLLECTION_INTERVAL=$NOMAD_TELEMETRY_COLLECTION_INTERVAL \
    NOMAD_TELEMETRY_DISABLE_HOSTNAME=$NOMAD_TELEMETRY_DISABLE_HOSTNAME \
    NOMAD_TELEMETRY_PROMETHEUS_METRICS=$NOMAD_TELEMETRY_PROMETHEUS_METRICS \
    NOMAD_TELEMETRY_PUBLISH_ALLOCATION_METRICS=$NOMAD_TELEMETRY_PUBLISH_ALLOCATION_METRICS \
    NOMAD_TELEMETRY_PUBLISH_NODE_METRICS=$NOMAD_TELEMETRY_PUBLISH_NODE_METRICS \
    VAULT_TOKEN=$VAULT_TOKEN \
        consul-template \
            -config /etc/consul-template.d/configurations/nomad/build-base-config.hcl \
            -once

sudo CONSUL_HTTP_ADDR=$CONSUL_HTTP_ADDR \
    CONSUL_CACERT=$CONSUL_CACERT \
    CONSUL_CLIENT_CERT=$CONSUL_CLIENT_CERT \
    CONSUL_CLIENT_KEY=$CONSUL_CLIENT_KEY \
    CONSUL_HTTP_SSL=$CONSUL_HTTP_SSL \
    CONSUL_HTTP_TOKEN=$CONSUL_HTTP_TOKEN \
        consul-template \
            -config /etc/consul-template.d/configurations/nomad/build-base-consul.hcl \
            -once

sudo NOMAD_SERVER_ENABLED=$NOMAD_ACL_ENABLED \
    NOMAD_BOOTSTRAP_EXPECT=$NOMAD_BOOTSTRAP_EXPECT \
        consul-template \
            -config /etc/consul-template.d/configurations/nomad/build-server-config.hcl \
            -once

sudo NOMAD_VAULT_CREATE_FROM_ROLE=$NOMAD_VAULT_CREATE_FROM_ROLE \
    NOMAD_VAULT_ENABLED=$NOMAD_VAULT_ENABLED \
    VAULT_ADDR=$VAULT_ADDR \
    VAULT_CACERT=$VAULT_CACERT \
    VAULT_CLIENT_CERT=$VAULT_CLIENT_CERT \
    VAULT_CLIENT_KEY=$VAULT_CLIENT_KEY \
    VAULT_TOKEN=$VAULT_TOKEN \
        consul-template \
            -config /etc/consul-template.d/configurations/nomad/build-vault-config.hcl \
            -once
