#!/usr/bin/env bash

source /etc/envs/build-env-vars

sudo AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
AWS_REGION=$AWS_REGION \
AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
VAULT_AGENT_ADDR=$VAULT_AGENT_ADDR \
VAULT_API_ADDR=$VAULT_API_ADDR \
VAULT_AWSKMS_SEAL_KEY_ID=$VAULT_AWSKMS_SEAL_KEY_ID \
VAULT_CLUSTER_ADDR=$VAULT_CLUSTER_ADDR \
VAULT_DISABLE_MLOCK=$VAULT_DISABLE_MLOCK \
VAULT_LOG_FORMAT=$VAULT_LOG_FORMAT \
VAULT_LOG_LEVEL=$VAULT_LOG_LEVEL \
VAULT_RAFT_NODE_ID=$VAULT_RAFT_NODE_ID \
VAULT_RAFT_PATH=$VAULT_RAFT_PATH \
VAULT_UI=$VAULT_UI \
    consul-template \
        -config /etc/consul-template.d/configurations/vault/build-server-config-no-tls.hcl \
        -once