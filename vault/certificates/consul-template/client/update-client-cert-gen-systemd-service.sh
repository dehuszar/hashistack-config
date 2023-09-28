#!/usr/bin/env bash

source /etc/envs/build-env-vars

sudo systemctl daemon-reload
sudo systemctl enable vault-client-cert-gen.service
sudo systemctl enable vault-client-cert-gen.timer
sudo systemctl start vault-client-cert-gen.service