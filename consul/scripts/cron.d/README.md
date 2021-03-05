# Usage
This folder contain all the cron files you want to run on Consul client's or server's behalf.  Use the provision scripts to push your scripts or any updates.

The examples for generating snapshots uses rclone to back snapshots to a remote S3 compatible object store, Wasabi.  That's just what I use, feel free to do what's best for you, but I strongly recommend you backup your snapshots to _somewhere_.  If you do go the route I've taken, you'll want rclone to be installed on your nodes.
