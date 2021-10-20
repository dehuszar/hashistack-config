#!/usr/bin/env bash

source /etc/envs/build-env-vars

sudo CONSUL_CACERT=$CONSUL_CACERT \
    CONSUL_SERVER_CERT=$CONSUL_SERVER_CERT \
    CONSUL_SERVER_KEY=$CONSUL_SERVER_KEY \
    CONSUL_HTTP_SSL_VERIFY_INCOMING=$CONSUL_HTTP_SSL_VERIFY_INCOMING \
    CONSUL_HTTP_SSL_VERIFY_OUTGOING=$CONSUL_HTTP_SSL_VERIFY_OUTGOING \
    CONSUL_HTTP_SSL_VERIFY_SERVER_HOSTNAME=$CONSUL_HTTP_SSL_VERIFY_SERVER_HOSTNAME \
        consul-template \
            -config /etc/consul-template.d/configurations/consul/build-server-tls.hcl \
            -once
