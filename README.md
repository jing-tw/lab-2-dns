# lab-2-dns

[vagrant + puppet lab, 2-node] os: ubuntu/trusty64, ip: 192.168.50.10/11

Detail: https://docs.google.com/document/d/1Mo1Q85ppvud_rQHDa43qOvRbkGwpPgLxZgCSGbResoQ/edit?usp=sharing

by Jing.

### Requirement
1. VirtualBox
2. Vagrant
	vagrant box add ubuntu/trusty64
3. Puppet
	sudo apt-get install puppetmaster
4. Module
	- puppet module install adrien-network

### Usage:
	- [dns] vagrant up && vagrant ssh
	- [vm1] vagrant up && vagrant ssh
	- [vm2] vagrant up && vagrant ssh
	- [vm3] vagrant up && vagrant ssh
	
###  Config:
	upddate dns server
		[dns] vi ./manifests/default.pp::dnsmasq::address 
		[host] vagrant provision;vagrant ssh
	add new machine
		step 1: assign ip
			[vm3] vi ./manifests/default.pp::ipaddress
			[host] vagrant provision;vagrant ssh
		step 2: update dns server
			[dns] vi ./manifests/default.pp::dnsmasq::address 
			[host] agrant provision;vagrant ssh
### VM info
    os: ubuntu/trusty64
    dns: Domain Name Server (default.pp)
	eth1: 192.168.50.2   (by vagrant)
	
    vm1: 
	    eth1: 192.168.50.10  (by puppet)
    vm2: 
	    eth1: 192.168.50.11  (by puppet)

### Launch VM
    vm1: vagrant up
    vm2: vagrant up



'

