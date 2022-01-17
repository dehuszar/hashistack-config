#!/usr/bin/env bash

ansible $1 -m copy -a "src=./bash_aliases dest=/home/pi/.bash_aliases"