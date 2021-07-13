#!/usr/bin/env bash
echo "creating nomad user and config folders"
ansible $1 -b -a "sudo mkdir --parents /opt/nomad" $2
ansible $1 -b -a "sudo mkdir --parents /etc/nomad.d" $2
ansible $1 -b -a "sudo useradd --system --home /etc/nomad.d --shell /bin/false nomad" $2
# ansible $1 -b -a "sudo cp /home/pi/hashipi-config/nomad/nomad.hcl /etc/nomad.d/" $2
ansible $1 -b -a "chmod 700 /etc/nomad.d/" $2
ansible $1 -b -a "sudo chown --recursive nomad:nomad /opt/nomad /etc/nomad.d" $2

# echo "downloading nomad and moving to /usr/local/bin/"
# sudo bash /home/pi/hashipi-config/nomad/scripts/get-nomad $1 $2

echo "setting up nomad autocomplete"
ansible $1 -b -a "nomad -autocomplete-install" $2
ansible $1 -b -a "complete -C /usr/local/bin/nomad nomad" $2
