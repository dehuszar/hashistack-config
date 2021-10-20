#!/usr/bin/env bash

source /etc/envs/build-env-vars

sudo CONSUL_CACERT=$CONSUL_CACERT \
    CONSUL_CLIENT_CERT=$CONSUL_CLIENT_CERT \
    CONSUL_CLIENT_KEY=$CONSUL_CLIENT_KEY \
    CONSUL_HTTP_SSL_VERIFY_OUTGOING=$CONSUL_HTTP_SSL_VERIFY_OUTGOING \
    CONSUL_HTTP_SSL_AUTO_ENCRYPT=$CONSUL_HTTP_SSL_AUTO_ENCRYPT \
        consul-template \
            -config /etc/consul-template.d/configurations/consul/build-client-tls.hcl \
            -once
