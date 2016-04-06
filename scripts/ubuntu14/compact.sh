#!/usr/bin/env bash

apt-get -y remove linux-headers-$(uname -r) build-essential perl dkms
apt-get -y autoremove
apt-get -y purge

echo "Compacting hard-drive, could take few minutes"
dd if=/dev/zero of=/junk bs=1M
rm -f /junk

sync
