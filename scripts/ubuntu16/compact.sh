#!/bin/bash

# WARNING: this script should't run with strict error code checking
# dd will exit with error code when filling hard-drive with junk data

export DEBIAN_FRONTEND="noninteractive"

echo "Removing old kernels.."
dpkg -l linux-{image,headers}-* | \
awk '/^ii/{print $2}' | \
egrep '[0-9]+\.[0-9]+\.[0-9]+' | \
grep -v $(uname -r) | \
xargs apt-get -y --purge remove

echo "Compacting hard-drive.."
apt-get autoremove -y --purge && \
apt-get clean -y && \
apt-get autoclean -y

dd if=/dev/zero of=/junk bs=1M || /bin/true
rm -f /junk
sync
