# Setup DNS server
# by Jing.

node default {
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
