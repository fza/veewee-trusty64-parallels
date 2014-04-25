# Veewee definition for a lightweight Ubuntu 14.04 (Trusty Tahr) machine with Parallels support

## Spec

* Based on template: `ubuntu-14.04-server-amd64`
* Does not include Puppet or Chef
* Only contains default ruby package

## Usage

To build the vagrant box:

	cd veewee
	mkdir -p definitions
	git submodule add https://github.com/fza/veewee-trusty64-parallels.git definitions/trusty64-parallels
	veewee parallels build trusty64-parallels
	veewee parallels export trusty64-parallels
	vagrant box add --name trusty64-parallels trusty64-parallels.box 