# -*- mode: ruby -*-
# vi: set ft=ruby :

APPSERVER_IP = '100.0.1.10'
LB_IP = '100.0.1.11'
DB_IP = '100.0.1.12'
PRIVATE_KEY_SOURCE = '/home/cshuo/.vagrant.d/insecure_private_key'
PRIVATE_KEY_DEST = '/home/vagrant/.ssh/id_rsa'

Vagrant.configure("2") do |config|

  config.vm.define "database" do |database|
    database.vm.box = "ubuntu/trusty64"
    database.ssh.insert_key = false
    database.vm.network "private_network", ip: DB_IP
    database.vm.provider "virtualbox" do |v|
      v.cpus = 2
      v.memory = 2048
    end
    database.vm.provision :file do |file|
      file.source = PRIVATE_KEY_SOURCE
      file.destination = PRIVATE_KEY_DEST
    end
  end

  config.vm.define "lb" do |lb|
    lb.vm.box = "ubuntu/trusty64"
    lb.ssh.insert_key = false
    lb.vm.network "private_network", ip: LB_IP
    lb.vm.provider "virtualbox" do |v|
      v.cpus = 2
      v.memory = 1024
    end
    lb.vm.provision :file do |file|
      file.source = PRIVATE_KEY_SOURCE
      file.destination = PRIVATE_KEY_DEST
    end
  end

  config.vm.define "appserver" do |appserver|
    appserver.vm.box = "ubuntu/trusty64"
    appserver.ssh.insert_key = false
    appserver.vm.network "private_network", ip: APPSERVER_IP
    appserver.vm.provider "virtualbox" do |v|
      v.cpus = 2
      v.memory = 2048
    end
    appserver.vm.provision :file do |file|
      file.source = PRIVATE_KEY_SOURCE
      file.destination = PRIVATE_KEY_DEST
    end
    appserver.vm.provision :shell, path: "as_install.sh"
  end

end
