# == Class: nacs_management::autologin
#
# This is the basic setup for nacs_management and creates the NACSManage
# directory on all NACS support Operating Systems.
#
# === Examples
#
# include nacs_management::autologin('username','password')
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::autologin($user, $password) {
	if ($operatingsystem == 'windows') {
		registry_value {'hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogin\DefaultUserName':
		   ensure => present,
		   type   => string,
		   data   => "${user}",
		}	

		registry_value {'hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogin\DefaultPassword':
		    ensure => present,
		    type   => string,
		    data   => "${password}",
		}

		registry_value {'hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogin\AutoAdminLogon':
		    ensure => present,
		    type   => string,
		    data   => '1',
		}
	}
}