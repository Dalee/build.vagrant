#!/usr/bin/env bash

# install guest additions
yum -y install gcc cpp dkms make bzip2 perl kernel-devel-$(uname -r) kernel-headers-$(uname -r)

mkdir /tmp/virtualbox
mount -o loop /home/vagrant/VBoxGuestAdditions_$(cat /home/vagrant/.vbox_version).iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso
rm /home/vagrant/.vbox_version
