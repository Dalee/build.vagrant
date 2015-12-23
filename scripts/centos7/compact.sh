#!/usr/bin/env bash

yum -y remove gcc cpp dkms make bzip2 perl kernel-devel-$(uname -r) kernel-headers-$(uname -r)
yum clean all

# disable some services
systemctl disable auditd.service
systemctl disable vboxadd-x11.service

rm -rf "/tmp/*"
rm -rf "/etc/udev/rules.d/70-persistent-net.rules"

for ifcfg in $(ls /etc/sysconfig/network-scripts/ifcfg-*)
do
	IFACE="$(basename ${ifcfg})"
    if [ $IFACE != "ifcfg-lo" ]
    then
        sed -i '/^UUID/d'   "/etc/sysconfig/network-scripts/$IFACE"
        sed -i '/^HWADDR/d' "/etc/sysconfig/network-scripts/$IFACE"
    fi
done

echo "Compacting hard-drive, could take few minutes"
dd if=/dev/zero of=/junk bs=1M
rm -f /junk

sync
