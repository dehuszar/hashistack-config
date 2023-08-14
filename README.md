# hashistack-config
(formerly hashipi-config)
This repo is a collection of tools and configurations for my Raspberry Pi homelab cluster built on HashiCorp's Consul, Nomad, and Vault, with assists from Consul-Template.  While there will --likely for a little while longer-- some vestigial references to raspberry pis, the goal of this repo is to provide for a bare-metal rollout of each service with only a few keystrokes.

## Why?

HashiCorp's tools, once set up, are remarkably simple to use given what they do for you.  Getting them up and running, however, can be a bit of a battle with multiple subsequent waves of effort required to
- prepare the host OS to run the binaries as systemd services
- deploy agent configurations
- enable https and gossip encryption
- enable cross-product integrations, and
- potentially several waves of Terraform deploys required to set up the Consul, Vault, and Nomad services and jobs themselves

When deploying to VMs the Cloud-Init/User-Data and remote_exec steps give you a few hooks to do a lot of this work, and the nature of Terraform resources for things like `ec2_instance` provide a clean interface for looking up attributes of the host VM which the various clusters require to function.

From bare-metal, this gets a little more difficult as you lose a lot of the niceties and abstractions that come with automated VM deployment; and doing things like injecting env vars or terminating the instance and redeploying aren't as effortless.  I try to use (where I know how) HashiCorp tools exclusively.  I fall back to a light layer of ansible just to get a few key pieces in place before the code that follows kicks in.

There are some [great tools](https://github.com/solo-io/packer-builder-arm-image) that help in making a "golden image" which could be written to an SD card or a RPi network boot setup.  I would love to get to that beautiful place, but it is out of scope for the moment.  I would gladly include or make reference to any implementations that try to tackle these upgrades.

This is a gigantic work-in-progress and I am still (and will always be) a student of Linux, microservice architecture, and general infrastructure development.  So if you see something dumb, dangerous, confusing, or that could be done more efficiently, I implore you to file an issue.  I would be happy to receive feedback.

## Steps to configure new Vault Clusters
Each wave's particulars will be described in more detail in READMEs tucked away in the various sub-folders for each tool.  We will discuss the game-plan at a high level here.
### Wave 1 :: Deploy environment variables and use them to generate config files
Most tutorials give you complete hcl files to use as reference for configuring your server and client agents, detailing a few sensible defaults with the sensitive bits redacted.  This is great, but if used as provided, requires a lot of wrenching on several minute details across several (in my case 12 RPi & 2 amd64) machines.  Doing things like bootstrapping the cluster and enabling https become incredibly tedious and error prone without putting a few layers of automation in place.

This first wave will (utilizing stock env vars provided by each tool where available) deploy env files which contain values you would like to have each agent node utilize in the configuration file.  These will be consumed by Consul-Template in subsequent waves.

### Wave 2 :: Generating agent configs
In order to start Vault, we'll need to run some scripts to tell Consul-Template to generate our config files.  Having done so, the envs deployed in the previous step will have been stamped into place and Vault should run.

### Wave 3 :: Deploying service configurations via Terraform
With our Agents now running (in non-TLS mode to start), we can start deploying our configs for Vault itself.

In most cases this will involve deploying configurations for ACL policies and roles, secrets backends, users, etc.  These things tend to be pretty proprietary to one's individual use-cases and is out of the scope of this repo.  The only real assumption I'm making for this wave is that a PKI/CA configuration in Vault is being deployed to facilitate TLS certificate generation.

### Wave 4 :: Generating certificates

### Wave 5 :: Enabling HTTPS

### Wave 6 :: Enabling Integrations
