#!/usr/bin/env bash
ansible $1 -b -m copy -a "src=consul/consul.service dest=/etc/systemd/system/" --ask-become-pass