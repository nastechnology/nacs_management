# == Class: nacs_management::atrts
#
# Install ATRT Shortcuts for students
#
# === Examples
#
# include nacs_management::atrtsw
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::atrts {
    if ($operatingsystem == 'windows'){
    	
	package { 'atrt.student':
	    ensure => installed,
	}

	file { "C:\Documents and Settings\All Users\Desktop\All The Right Type Student.lnk":
	    ensure  => file,
	    source  => 'puppet:///modules/nacs_management/All The Right Type Student.lnk',
	    require => Package['atrt.student'],
	}

    }
}
