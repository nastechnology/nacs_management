# == Class: nacs_management
#
# This is the basic setup for nacs_management and creates the NACSManage
# directory on all NACS support Operating Systems.
#
# === Examples
#
# include nacs_management
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management {

    if ($operatingsystem == 'Darwin') or ($operatingsystem == 'Ubuntu'){
	 file {"/opt/NACSManage":
                ensure  => directory,
                owner   => "technology",
                group   => "staff",
                mode    => 0755,
	}
    }
    else {
	# Assumes Windows - for now
	file { "C:/NACSManage":
	    ensure => directory,
	    owner  => 'Administrator',
	    group  => 'Administrators',
	    mode   => 0755,
	}
    }

}
