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
<<<<<<< HEAD
	if($operatingsystem == 'windows') {
=======
	if($operatingsystem == 'windows') {}
>>>>>>> e3b7b8d5162b2a289c419f4290fab122ffe2bd50
		file { 'C:/NACSManage/DelProf2.exe':
		   ensure => 'file',
		   owner => 'Administrator',
		   group => 'Administrators',
		   mode => 0777,
		   source => "puppet:///modules/nacs_management/DelProf2.exe",
		}
		
		scheduled_task { 'DeleteOldProfiles':
		   ensure    => present,
		   enabled   => true,
		   command   => "C:/NACSManage/DelProf2.exe",
		   arguments => "/ed:admin* /q /i /d:80",
		   #require  => File['C:/NACSManage/DelProf2.exe'],
		   trigger   => {
			schedule   => daily,
		  	start_time => '09:00',
		   }
		}
	}
}
