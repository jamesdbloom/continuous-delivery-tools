group { "puppet":
  	ensure => "present",
}
File { owner => 0, group => 0, mode => 0644 }
file { '/etc/motd':
	content => "Welcome to your Vagrant-built virtual machine!
              Managed by Puppet.\n",
}
class yum::update
{
	exec { "yum-update":
		command => "yum clean all; yum -q -y update; rm -rf /var/tmp/forceyum",
		timeout => 1800,
	}
}
include yum::update