### Wave 1 :: Deploy environment variables and use them to generate config files

It should be noted that there are some security implications of keeping these env files on your development machines and transferring them onto your agent machines.  With VMs you get to inject them into the environment at the time of instantiation, reducing or eliminating the need to keep files on the machine.  With bare-metal provisioning, this gets a little trickier.

Even more, some of these values for Vault and Nomad may be better managed by the Consul KV engine (particularly non-secrets), but for Consul's configuration there's a bit of a chicken-and-egg problem storing consul variables in the Consul service which has not been stood up yet.  So while future iterations may see many of these values and scripts get moved over to an envconsul pattern, some of these values will likely have to use this pattern or something similar to it.

This workflow is my first pass at doing this in a clean, secure-ish, and tolerably effortless way.  If anyone has some platforms-fu that would be an improvement on what's outlined here, I would be grateful if you were to file an issue on the repo.

That said...

Depending on what you are trying to do, or what phase of setup you are in, some combination of the following env files should get deployed to every devices OS.  I've chosen `/etc/envs/`, but dealer's choice.  (if there's a more "correct" path these should go in I'm all ears)
- build-env-vars
- .env-aws
- .env-aws-vault
- .env-base
- .env-consul-acl
- .env-consul-base
- .env-consul-gossip
- .env-consul-no-tls-client
- .env-consul-server
- .env-consul-tls-client-agent
- .env-consul-tls-client-cli
- .env-consul-token-vault1 [and vault2, vault3, and all your nomad clients and servers which will utilize Consul ACL tokens]
- .env-nomad
- .env-vault-base
- .env-vault-no-tls
- .env-vault-tls

None of these .env-* files are included in the repo.  There are example files to start you off, but you will need to create your own, as everyone's config will be slightly different, and values may also change over time; particularly when advancing from the no-tls configuration to an https setup.

These files get consumed in two places, both by running the `build-env-vars` script.  The first is your bash session.  If you add the following snippet to your .bashrc:
```bash 
source /etc/envs/build-env-vars
```
you will be able to access all the relevant env vars from your ssh/terminal session.

The second system is consul-template, which we will use to print your agent configurations on-demand.  Once done, you _should_ be able to restart your services and access them over HTTP.