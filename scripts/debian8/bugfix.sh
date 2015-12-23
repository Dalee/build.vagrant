#!/usr/bin/env bash

# workaround for halt:
# https://github.com/mitchellh/vagrant/pull/6315
mv /sbin/shutdown /sbin/shutdown.original
( cat <<EOP
#!/usr/bin/env bash
# workaround for bug
# https://github.com/mitchellh/vagrant/pull/6315
/sbin/shutdown.original -h now &
EOP
) > /sbin/shutdown
chown root:root /sbin/shutdown
chmod +x /sbin/shutdown

# speedup loading time, decreasing timeout of grub
sed -i "s/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/" /etc/default/grub
update-grub
