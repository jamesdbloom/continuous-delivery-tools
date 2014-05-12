#!/bin/bash

# Check that this script hasn't been run already
if [ ! -f /var/log/vmsetup ];
then
	# Point to an apt repo within our LAN to avoid hammering the public servers
	# sed -i 's/us\.archive\.ubuntu\.com\/ubuntu/10.64.50.32:3142\/us.archive.ubuntu.com\/ubuntu/g' /etc/apt/sources.list
	# sed -i 's/security\.ubuntu\.com\/ubuntu/10.64.50.32:3142\/security.ubuntu.com\/ubuntu/g' /etc/apt/sources.list

	# 1. Update packages
	apt-get -y update
	
	# 2. Install Oracle Java 7

	# add ppa
	apt-get install -y python-software-properties
	add-apt-repository -y ppa:webupd8team/java
	 
	# enable silent install
	echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
	echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
	echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

	apt-get -y update	 
	apt-get install -y oracle-java7-installer
	 
	# not always necessary, but just in case...
	update-java-alternatives -s java-7-oracle
	 
	# setting Java environment variables
	apt-get install -y oracle-java7-set-default
	
	# 3. Install Maven
	apt-get install -y maven

	# 4. Install Debian Packing Tools
	apt-get install -y lintian dput

	# 5. Install General Tools
	apt-get install -y curl wget vim
	
	# 6. Install node and npm

	# remove incorrect bundled installations
	apt-get purge -y nodejs npm

	# install correct versions from Chris Lea's repo
	apt-get install -y python-software-properties python g++ make
	add-apt-repository --yes ppa:chris-lea/node.js
	apt-get update
	apt-get install -y nodejs

	# 7. Install git
	apt-get install -y git
fi
