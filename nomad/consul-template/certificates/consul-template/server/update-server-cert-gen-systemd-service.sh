#!/usr/bin/env bash
# FIXME :: service not seeing token
source /etc/envs/build-env-vars

sudo systemctl daemon-reload
sudo systemctl enable nomad-server-cert-gen.service
sudo systemctl enable nomad-server-cert-gen.timer
sudo systemctl start nomad-server-cert-gen.service
