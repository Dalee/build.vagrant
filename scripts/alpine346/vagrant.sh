#!/usr/bin/env bash

# upgrade system
apk update
apk upgrade --no-self-upgrade --available
apk add sudo bash curl wget

# add vagrant user
adduser -D vagrant
echo 'vagrant:vagrant' | chpasswd

# install vagrant insecure key, it will be replaced during initial "vagrant up"
echo "" > /etc/motd
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
echo "Defaults:vagrant !requiretty" >> /etc/sudoers.d/vagrant
sed 's/\/bin\/ash/\/bin\/bash/g' -i /etc/passwd

mkdir -pm 700 /home/vagrant/.ssh
curl -sSo /home/vagrant/.ssh/authorized_keys "https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub"
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh

# add shutdown command for vagrant
echo -e '#!/usr/bin/env bash\n/sbin/poweroff' > /sbin/shutdown
chmod +x /sbin/shutdown
