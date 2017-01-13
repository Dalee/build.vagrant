#!/bin/bash -eux

export DEBIAN_FRONTEND="noninteractive"

echo "======================================================"
echo "======================================================"
echo ""
echo "            Installing Guest Additions...             "
echo ""
echo "======================================================"
echo "======================================================"
# install dependencies
apt-get install -y linux-headers-$(uname -r) build-essential perl dkms

# install guest additions
mkdir /tmp/virtualbox
VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop /home/vagrant/VBoxGuestAdditions_$VERSION.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso
rm /home/vagrant/.vbox_version

# purge and force reinstall openssh-server
apt-get -y remove linux-headers-$(uname -r) build-essential perl dkms && \
apt-get -y autoremove && \
apt-get -y purge && \
apt-get -y install openssh-server
