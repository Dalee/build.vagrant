#!/bin/bash -eux

export DEBIAN_FRONTEND="noninteractive"

KERNEL=$(uname -r)
VAGRANT_INSECURE_KEY="https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub"

echo "======================================================"
echo "======================================================"
echo ""
echo "           Current booted kernel: ${KERNEL}           "
echo ""
echo "======================================================"
echo "======================================================"
echo ""
echo "            Installing vagrant files..                "
echo ""
echo "======================================================"
echo "======================================================"
mkdir /home/vagrant/.ssh && \
curl ${VAGRANT_INSECURE_KEY} -s -o /home/vagrant/.ssh/authorized_keys && \
chown -R vagrant:vagrant /home/vagrant/.ssh && \
chmod 0700 /home/vagrant/.ssh && \
chmod 0600 /home/vagrant/.ssh/authorized_keys && \
touch /home/vagrant/.hushlogin && \
chown vagrant:vagrant /home/vagrant/.hushlogin
echo "Insecure key installed"

echo "======================================================"
echo "======================================================"
echo ""
echo "            Installing mandatory software..           "
echo ""
echo "======================================================"
echo "======================================================"
apt-get -qq -y update && \
apt-get install -y \
    mc \
    nano \
    htop \
    strace \
    vim \
    make \
    git \
    zip \
    unzip \
    software-properties-common && \
apt-add-repository -y ppa:ansible/ansible && \
apt-get -qq -y update && \
apt-get -qq -y install ansible
