#!/usr/bin/env bash
source /etc/envs/build-env-vars

sudo systemctl daemon-reload
sudo systemctl enable consul-client-cert-gen.service
sudo systemctl enable consul-client-cert-gen.timer
sudo systemctl start consul-client-cert-gen.service
