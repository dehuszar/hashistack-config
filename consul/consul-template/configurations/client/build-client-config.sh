#!/usr/bin/env bash

source /etc/envs/build-env-vars

sudo CONSUL_ACL_ENABLED=$CONSUL_ACL_ENABLED \
    CONSUL_ACL_DEFAULT_POLICY=$CONSUL_ACL_DEFAULT_POLICY \
    CONSUL_ACL_DOWN_POLICY=$CONSUL_ACL_DOWN_POLICY \
    CONSUL_ACL_ENABLE_TOKEN_PERSISTENCE=$CONSUL_ACL_ENABLE_TOKEN_PERSISTENCE \
    CONSUL_HTTP_TOKEN=$CONSUL_HTTP_TOKEN \
        consul-template \
            -config /etc/consul-template.d/configurations/consul/build-acl-config.hcl \
            -once

sudo CONSUL_CLIENT_ADDR=$CONSUL_CLIENT_ADDR \
    CONSUL_DATA_DIR=$CONSUL_DATA_DIR \
    CONSUL_DATACENTER=$CONSUL_DATACENTER \
    CONSUL_NODE_NAME=$CONSUL_NODE_NAME \
    CONSUL_PRIMARY_DATACENTER=$CONSUL_PRIMARY_DATACENTER \
    CONSUL_RETRY_JOIN1=$CONSUL_RETRY_JOIN1 \
    CONSUL_RETRY_JOIN2=$CONSUL_RETRY_JOIN2 \
    CONSUL_RETRY_JOIN3=$CONSUL_RETRY_JOIN3 \
    CONSUL_RAFT_MULTIPLIER=$CONSUL_RAFT_MULTIPLIER \
        consul-template \
            -config /etc/consul-template.d/configurations/consul/build-base-config.hcl \
            -once
