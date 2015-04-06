class iptables {
	package { 'iptables':
		ensure => present,
		before => File['/etc/sysconfig/iptables'],
	}
	file { '/etc/sysconfig/iptables':
		ensure => file,
		owner => "root",
		group => "root",
		mode => 600,
		replace => true,
		source => "puppet:///modules/iptables/iptables.txt",
	}
	service { 'iptables':
		ensure => running,
		enable => true,
		subscribe => File['/etc/sysconfig/iptables'],
	}
}
