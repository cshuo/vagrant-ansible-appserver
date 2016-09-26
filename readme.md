## Ansible-Vagrant-AS
> Deployment of AppServer Using Vagrant and Ansible

### Getting Started
This repository contains scripts of [Vagrant](https://www.vagrantup.com/) and [Ansible](https://www.ansible.com/) to automatically deploy an Application
Server with Load Balancer and Database backend. 

#### Prerequisites
- Vitualbox
- Vagrant

#### Easy Deployment
- Clone this repository
```
$ git clone https://github.com/cshuo/vagrant-ansible-appserver.git
```
- Modify configurations of VMs according to your physical environment, e.g, size of memory and number of CPU.
- Bootup the VMs using Vagrant commands
```
$ cd vagrant-ansible-appserver
$ vagrant up
```
Waiting for a while, 3 Vms will be started.
- Deploy Application Server using Ansible, ssh into the control vm node, and run ansible playbooks.
```
$ vagrant ssh appserver
$ cd /vagrant/apt
$ ansible-playbook -i hosts playbook.yml
```
