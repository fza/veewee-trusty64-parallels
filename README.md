## Veewee definition for a lightweight Ubuntu 14.04 box for Parallels

### Spec

* Based on template: `ubuntu-14.04-server-amd64`
* Does not include Puppet or Chef
* Only contains default ruby package

### Use it directly

Simply initialize Vagrant using:

	vagrant init fza/trusty64
	
[Go here](https://vagrantcloud.com/fza/trusty64) to see the box on Vagrant Cloud.

### Build it yourself

	cd veewee
	mkdir -p definitions
	git submodule add -f https://github.com/fza/veewee-trusty64-parallels.git definitions/trusty64-parallels
	veewee parallels build trusty64-parallels
	veewee parallels export trusty64-parallels
	vagrant box add --name trusty64-parallels trusty64-parallels.box

### Perfectly fitting PHP5 web stack provisioning

[Have at look!](https://github.com/fza/vagrant-trusty64-php)

	
### Why no Puppet nor Chef?

*This is my opinion:* I actually don't see the major benefit in using these tools if you only want to test things locally during development and don't want to be a sysadmin. Things should just work, right? Not that Puppet/Chef were bad tools, but they are not made for us, developers. Also, boxes grow in size if these tools are present and there's software installed you probably never need. A much better and more holistic approach (e.g. for easier deployment) would be to use [Docker](https://www.docker.io/).
