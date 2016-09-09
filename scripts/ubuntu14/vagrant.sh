#!/bin/bash -eux

# upgrade system
export DEBIAN_FRONTEND=noninteractive && \
	sed 's/archive.ubuntu.com/mirror.yandex.ru/' -i /etc/apt/sources.list && \
	apt-get -qq -y update && \
	apt-get -qq -y -o Dpkg::Options::="--force-confold" upgrade && \
	apt-get -qq -y clean

# install vagrant insecure key, it will be replaced during initial "vagrant up"
mkdir /home/vagrant/.ssh
wget --no-check-certificate -O authorized_keys "https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub"
mv authorized_keys /home/vagrant/.ssh
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys
