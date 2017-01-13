#!/bin/bash

# this script should't run with error code checking
# dd will exit with error code when filling hard-drive with junk data

export DEBIAN_FRONTEND="noninteractive"

echo "======================================================"
echo "======================================================"
echo ""
echo "            Removing old kernels (if any)             "
echo ""
echo "======================================================"
echo "======================================================"
dpkg -l linux-{image,headers}-* | \
awk '/^ii/{print $2}' | \
egrep '[0-9]+\.[0-9]+\.[0-9]+' | \
grep -v $(uname -r) | \
xargs sudo apt-get -y purge

echo "======================================================"
echo "======================================================"
echo ""
echo "            Removing software..                       "
echo ""
echo "======================================================"
echo "======================================================"
rm /root/.profile && \
apt-get -qq -y update && \
apt-get remove -y --purge \
    binutils cpp dpkg-dev \
    update-manager-core \
    ubuntu-release-upgrader-core \
    friendly-recovery \
    laptop-detect \
    popularity-contest \
    pciutils \
    usbutils \
    plymouth \
    parted \
    ntfs-3g \
    installation-report \
    command-not-found \
    language-pack-gnome-en \
    apparmor && \
apt-get autoremove -y --purge && \

echo "======================================================"
echo "======================================================"
echo ""
echo "    Compacting hard-drive (could take few minutes)    "
echo ""
echo "======================================================"
echo "======================================================"
apt-get autoremove -y --purge && \
apt-get purge -y && \
apt-get clean -y && \
apt-get autoclean -y

dd if=/dev/zero of=/junk bs=1M || /bin/true
rm -f /junk && sync
