#!/usr/bin/env bash

# install guest additions
apt-get install -y linux-headers-$(uname -r) build-essential perl dkms
mkdir /tmp/virtualbox
VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop /home/vagrant/VBoxGuestAdditions_$VERSION.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso
rm /home/vagrant/.vbox_version
