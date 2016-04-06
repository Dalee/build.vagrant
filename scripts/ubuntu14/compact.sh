#!/usr/bin/env bash

echo "Compacting hard-drive, could take few minutes"
dd if=/dev/zero of=/junk bs=1M
rm -f /junk

sync
