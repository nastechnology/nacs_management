# == Class: nacs_management::delprof
#
# This is the basic setup for nacs_management and creates the NACSManage
# directory on all NACS support Operating Systems.
#
# === Examples
#
# include nacs_management::delprof
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::delprof {
	if($operatingsystem == 'windows') {}
		file { 'C:/NACSManage/DelProf2.exe':
		   ensure => 'file',
		   owner => 'Administrator',
		   group => 'Administrators',
		   mode => 0777,
		   source => "puppet://$puppetserver/modules/delprof/DelProf2.exe",
		}
		exec { 'DeleteOldProfiles':
		   command => "cmd.exe /c C:/DelProf2.exe /ed:admin* /q /i /d:80",
		   require => File['C:/DelProf2.exe'],
		}
	}
}