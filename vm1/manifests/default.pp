# Setup auto setup network interface
# by Jing.
# Reference
# 	https://forge.puppetlabs.com/adrien/network

node default {

  network_config { 'eth0':
		ensure  => 'present',
		family  => 'inet',
		method  => 'dhcp',
		onboot  => 'true',
		hotplug => 'true',
		options => {'pre-up' => 'sleep 2'},
	}

	network_config { 'lo':
		ensure => 'present',
		family => 'inet',
		method => 'loopback',
		onboot => 'true',
	}

	network_config { 'eth1':
		ensure    => 'present',
		family    => 'inet',
		ipaddress => '192.168.50.10',
		method    => 'static',
		netmask   => '255.255.255.0',
		onboot    => 'true',
  }
  
  exec { "restart network":
		command => "/sbin/ifdown eth1 && /sbin/ifup eth1",
  }
  
   # setup name
  file { "/etc/hostname": 		content => "vm1"; 	}
	exec { "setup hostname":		command => "/bin/hostname vm1",	}
  
  # setup customized DNS server
  file { "/etc/resolv.conf": content => "nameserver 192.168.50.2"; }
}
