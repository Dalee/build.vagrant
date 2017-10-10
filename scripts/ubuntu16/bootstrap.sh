#!/usr/bin/env bash
set -eo pipefail

export DEBIAN_FRONTEND="noninteractive"
apt-get -qq -y update
apt-get -qq -y --purge remove unattended-upgrades

apt-get -qq -y --no-install-recommends install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get -qq -y update
apt-get -qq -y --no-install-recommends install ansible

echo "Installing Guest Additions.."
apt-get install -y --no-install-recommends \
    linux-headers-$(uname -r) build-essential perl dkms

mkdir -p /tmp/virtualbox
mount -o loop /home/vagrant/VBoxGuestAdditions_$(cat /home/vagrant/.vbox_version).iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run || true
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso
rm /home/vagrant/.vbox_version

apt-get -y --purge remove \
    linux-headers-$(uname -r) \
    binutils build-essential cpp cpp-5 dkms dpkg-dev g++ g++-5 gcc gcc-5 \
    libasan2 libatomic1 libc-dev-bin libc6-dev libcc1-0 libcilkrts5 libdpkg-perl \
    libgcc-5-dev libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpfr4 libmpx0 \
    libperl5.22 libquadmath0 libstdc++-5-dev libtsan0 libubsan0 linux-libc-dev \
    make patch perl perl-modules-5.22 xz-utils
