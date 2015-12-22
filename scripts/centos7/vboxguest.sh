#!/usr/bin/env bash

# install guest additions
yum -y install bzip2 wget perl gcc kernel-devel
mkdir /tmp/virtualbox
VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop /home/vagrant/VBoxGuestAdditions_$VERSION.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso
rm /home/vagrant/.vbox_version
