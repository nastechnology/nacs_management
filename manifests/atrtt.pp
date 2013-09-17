# == Class: nacs_management::atrtt
#
# Install ATRT Shortcuts for teachers
#
# === Examples
#
# include nacs_management::atrtt
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::atrtt {
    if ($operatingsystem == 'windows'){

	package { 'atrt.teacher':
	    ensure => installed,
	}

	file { "C:\Documents and Settings\All Users\Desktop\All The Right Type Teacher.lnk":
	    ensure  => file,
	    source  => 'puppet:///modules/nacs_management/All The Right Type Teacher.lnk',
	    require => Package['atrt.teacher'],
	}

    }
}
