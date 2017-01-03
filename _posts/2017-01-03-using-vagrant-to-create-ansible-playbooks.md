---
layout: post
title: "Using Vagrant to create Ansible playbooks"
date: 2017-01-03
categories: [dev]
tags: [ansible, vagrant]
assets: /assets/2017-using-vagrant-to-create-ansible-playbooks
excerpt_separator: <!--more-->
---
Recently I have been using Ansible to provision and manage a couple of servers.
Developing playbooks for me involves some trial and error. Having some kind of
playground to quickly test and experiment is a real time saver!

This post describes my setup for developing Ansible playbooks.

<!--more-->

# What is Ansible?
Ansible is a tool to help you manage and provision your Linux installations. It
automate installations, script migrations, etc. Basically it allow allows you
to script everything that needs to installed or configured on your servers.
More info can be found [here][1] and [here][2].

# What is Vagrant?
Vagrant describes itself as follows:

> \[...\] the command line utility for managing the lifecycle of virtual machines.

[source][3]

Vagrant allows one to quickly create virtual machines (VM) in a reproducible
manner. See here on how to [get started][4] with Vagrant.

# Combining Ansible and Vagrant
Combining the ability to quickly create VMs that allow access over ssh,
along with utilizing Ansible to provision those VMs makes for an ideal
development environment for Ansible playbooks. One can create a VM, run a
playbook, and check the result. Make edits to the playbook, rerun the playbook
on the VM, re-create the VM and start from scratch.

Vagrant supports Ansible out of the box as a [provisioner][5] which is really
convenient.

# Prerequisites
This post assumes a Linux host system. The following needs to be installed:

* Vagrant (1.8.5)
* VirtualBox (5.1.6)
* Ansible (ansible 2.3.0 devel bec9ebbf30)

The version numbers above are the ones I used when writing this post.

# Getting started
First thing we need is a Vagrantfile, this instructs Vagrant on how to setup
and configure a VM.

## Create a Vagrantfile
Create a file called `Vagrantfile` in an empty directory with the following
content:

```
Vagrant.require_version ">= 1.7.0"
Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.provision "shell", inline: "apt-get update && apt-get -qq install python python-pycurl python-apt"

  config.vm.provision "ansible", type: "ansible" do |ansible|
    ansible.verbose = "" # can be set to "vvv" for verbose logging.
    ansible.playbook = "playbook.yml"
    ansible.sudo = true
  end
end
```

The Vagrantfile above will instruct Vagrant to create a VM based on Ubuntu
Xenial 64 bit. It will install the dependencies needed to run Ansible playbooks
as well. The important part is:

```
config.vm.provision "ansible", type: "ansible" do |ansible|
  ansible.verbose = "" # can be set to "vvv" for verbose logging.
  ansible.playbook = "playbook.yml"
  ansible.sudo = true
end
```
This instructs Vagrant to run the Ansible provisioner with our playbook.yml
file as playbook.

## Create a playbook
Next, lets create a simple Ansible playbook. The playbook below is the simplest
form of a Ansible playbook. When your playbook grows a single file is quickly not
maintainable. The Ansible recommended way of [organizing your playbooks][6] can
still be used.

```
---
- hosts: all
  tasks:
  - name: apt-get update
    apt: update_cache=yes

  - name: Install deps
    apt: name=nginx  state=present
```

Now lets create our playbook. Create a file called `playbook.yml` next to the
Vagrantfile and copy the content above into it. This playbook will effectively
run `apt-get update` and then install Nginx.

# Lets build and provision the VM
Now that we are all setup we can have Vagrant create the VM and run the
playbook. Open a terminal in the directory containing the Vagrantfile. Run
`vagrant up`. This will make Vagrant create the VM and run the playbook. It
might take a while since it will download the Ubuntu image if not already
present.

The last part of the output should show the Ansible playbook being run:

```
[..]
==> default: Running provisioner: ansible (ansible)...
    default: Running ansible-playbook...

PLAY [all] *********************************************************************

TASK [setup] *******************************************************************
ok: [default]

TASK [apt-get update] **********************************************************
ok: [default]

TASK [Install deps] ************************************************************
changed: [default]

PLAY RECAP *********************************************************************
default                    : ok=3    changed=1    unreachable=0    failed=0   

```

To check the result of your playbook you can run `vagrant ssh` to login to the
VM and verify correct configuration. In this case we could run `nginx -v` to
verify that Nginx has been installed in the VM.

At this point changes or additions to the playbook can be made. Running
`vagrant provision` will rerun the provisioning system and execute the
playbook. Running `vagrant destroy && vagrant up` will destroy and re-create
the VM.

Alternatively Ansible can be invoked directly. Vagrant generates a inventory
file which can be used like so: `ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -become playbook.yml`.

# Skeleton project
I have created a skeleton project containing a Vagrantfile and Ansible
playbook (using roles) on my [Github][7].


[1]: https://www.ansible.com/it-automation
[2]: http://docs.ansible.com/ansible/intro_getting_started.html
[3]: https://www.vagrantup.com/docs/
[4]: https://www.vagrantup.com/docs/getting-started/
[5]: https://www.vagrantup.com/docs/provisioning/ansible.html
[6]: http://docs.ansible.com/ansible/playbooks_best_practices.html#content-organization
[7]: https://github.com/apollux/ansible-vagrant-skeleton
