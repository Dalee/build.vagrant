#!/usr/bin/env bash

yum -y remove cpp gcc *-headers *-devel perl*
yum clean all

dd if=/dev/zero of=/junk bs=1M
rm -f /junk

sync
