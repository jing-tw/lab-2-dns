# Setup DNS server
# by Jing.

node default {
	  
  # setup dns ip address
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
		ipaddress => '192.168.50.2',
		method    => 'static',
		netmask   => '255.255.255.0',
		onboot    => 'true',
  }
  
  exec { "restart network":
		command => "/sbin/ifdown eth1 && /sbin/ifup eth1",
  }
  
  # setup name
  file { "/etc/hostname": 		content => "server1"; 	}
	exec { "setup hostname":		command => "/bin/hostname server1",	}
  
  include dnsmasq
  # setup address mapping
  dnsmasq::address { "server1":		ip  => '192.168.50.2',  }  
  dnsmasq::address { "vm1":		ip  => '192.168.50.10',  }  
  dnsmasq::address { "vm2":		ip  => '192.168.50.11',  }
  dnsmasq::address { "vm3":		ip  => '192.168.50.12',  }
}
