#!/usr/bin/env bash

# install vagrant insecure key, it will be replaced during initial "vagrant up"
mkdir /home/vagrant/.ssh
wget --no-check-certificate -O authorized_keys "https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub"
mv authorized_keys /home/vagrant/.ssh
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys
