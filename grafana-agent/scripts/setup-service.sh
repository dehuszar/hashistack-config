#!/usr/bin/env bash
ansible $1 -b -a "sudo usermod -a -G adm grafana-agent" $2