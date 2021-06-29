#!/usr/bin/env bash

source /etc/envs/build-env-vars

sudo CONSUL_CACERT=$CONSUL_CACERT \
    CONSUL_SERVER_CERT=$CONSUL_SERVER_CERT \
    CONSUL_SERVER_KEY=$CONSUL_SERVER_KEY \
    CONSUL_HTTP_SSL_VERIFY=$CONSUL_HTTP_SSL_VERIFY \
        consul-template \
            -config /etc/consul-template.d/configurations/consul/build-server-tls.hcl \
            -once
