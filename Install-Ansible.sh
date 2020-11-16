#!/bin/bash
apt update && apt upgrade
apt install dirmngr
# Check if ubuntu ansible ppa has been added to apt sources and add if it hasn't
LINE='deb http://ppa.launchpad.net/ansible/ansible-2.9/ubuntu trusty main'
FILE='/etc/apt/sources.list'
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

# Add ppa keys and update/install ansible
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt update
apt -y install ansible gnupg gnupg2 gnupg1 aptitude python
