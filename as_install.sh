#!/bin/bash

apt-get apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install git ansible

# fix permissions on private key file
chmod 600 /home/vagrant/.ssh/id_rsa

# add web/database hosts to known_hosts (IP is defined in Vagrantfile)
ssh-keyscan -H 100.0.1.11 >> /home/vagrant/.ssh/known_hosts
ssh-keyscan -H 100.0.1.12 >> /home/vagrant/.ssh/known_hosts
chown vagrant:vagrant /home/vagrant/.ssh/known_hosts
