#!/usr/bin/env bash
sudo systemctl daemon-reload
sudo systemctl enable consul-server-cert-gen.service
sudo systemctl enable consul-server-cert-gen.timer
sudo systemctl start consul-server-cert-gen.service