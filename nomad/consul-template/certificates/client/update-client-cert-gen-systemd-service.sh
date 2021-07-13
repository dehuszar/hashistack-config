#!/usr/bin/env bash
source /etc/envs/build-env-vars

sudo systemctl daemon-reload
sudo systemctl enable nomad-client-cert-gen.service
sudo systemctl enable nomad-client-cert-gen.timer
sudo systemctl start nomad-client-cert-gen.service
