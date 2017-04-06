#!/usr/bin/env bash
set -eo pipefail

echo "Updating system"
apt-get -qq -y update

echo "Remove unattended-upgrades"
apt-get -qq -y remove unattended-upgrades

echo "Installing ansible"
apt-get -qq install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get -qq -y update
apt-get -qq -y install ansible
