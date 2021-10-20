#!/usr/bin/env bash

ansible $1 -b -a "sudo apt update && sudo apt full-upgrade -y" $2
ansible $1 -a "curl -sSL get.docker.com | sh"
ansible $1 -b -a "sudo usermod -aG docker pi" $2
ansible $1 -b -a "sudo usermod -aG docker nomad" $2