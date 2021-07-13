#! /bin/bash
sudo systemctl daemon-reload
sudo systemctl enable vault-server-cert-gen.service
sudo systemctl enable vault-server-cert-gen.timer
sudo systemctl start vault-server-cert-gen.service