#!/usr/bin/env bash

# install vagrant insecure key, it will be replaced during initial "vagrant up"
mkdir /home/vagrant/.ssh
curl -o /home/vagrant/.ssh/authorized_keys -kL "https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub"
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys
