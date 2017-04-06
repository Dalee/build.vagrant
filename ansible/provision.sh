#!/usr/bin/env bash
set -eo pipefail

ANSIBLE_FORCE_COLOR=1 ansible-playbook \
	-i "/home/web/project/ansible/inventory.ini" \
	"/home/web/project/ansible/vagrant.yml"
