## Ansible-Vagrant-AS
> 使用Vagrant和Virtualbox自动部署应用服务器.

### Getting Started
该项目包含了Vagrant和Ansible的一些脚本以实现应用服务器自动化部署(包含一个负载均衡器和后端数据库).

#### Prerequisites
- Vitualbox [[下载]](https://www.virtualbox.org/wiki/Downloads)
- Vagrant [[下载]](https://www.vagrantup.com/downloads.html)

#### Easy Deployment
- 克隆本项目
```
$ git clone https://github.com/cshuo/vagrant-ansible-appserver.git
```
- 根据实际物理主机的情况对脚本(Vagrantfile)进行修改, 如PRIVATE_KEY_SOURCE在windows和Linux下路径不同, 以及虚拟机的CPU和内存的配置.
- 使用以下命令启动虚拟机:
```
$ cd vagrant-ansible-appserver
$ vagrant up
```
稍等片刻, 3个虚拟机将会启动.
- 使用Ansible部署应用服务器: ssh进入appserver虚拟机, 执行Ansible的playbook
```
$ vagrant ssh appserver
$ cd /vagrant/apt
$ ansible-playbook -i hosts playbook.yml
```

#### 说明:
Vagrantfile是虚拟机的配置文件, 运行前需要进行一定的修改.

1. 将应用服务器安装包InfoSuite打包成as.tar.gz 放在apt/roles/appserver/files/下, 安装位置由apt/group_vars/all文件中as_dir指定.
2. 需要Vagrantfile的PRIVATE_KEY_SOURCE进行修改:
   如windowns下私钥位置可能是 "C:\Users\USERNAME\.vagrant.d\insecure_private_key", Linux系统下根据用户的不同,也需要对路径进行修改.
3. 目前负载均衡还未配置.
