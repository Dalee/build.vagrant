#!/bin/bash -eux

# upgrade system
export DEBIAN_FRONTEND=noninteractive && \
	apt-get -qq -y update && \
	apt-get -qq -y -o Dpkg::Options::="--force-confold" upgrade && \
	apt-get -qq -y clean

# upgrade python dependencies
export DEBIAN_FRONTEND=noninteractive && \
	update-ca-certificates --fresh && \
	apt-get -qq -y install python-dev libffi-dev libssl-dev python-pip && \
	pip install --upgrade urllib3 pyopenssl ndg-httpsclient pyasn1 && \
	apt-get -qq -y remove python-dev libffi-dev libssl-dev && \
	apt-get -qq -y clean

# install vagrant insecure key, it will be replaced during initial "vagrant up"
mkdir /home/vagrant/.ssh
wget \
    --no-check-certificate \
    -O /home/vagrant/.ssh/authorized_keys "https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub"

chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys
