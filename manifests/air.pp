# == Class: nacs_management::air
#
# Uses the districts checkin API to checkin with the server
# and is scheduled to run with every puppet run
#
# === Examples
#
# include nacs_management::air
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::air {
  package { 'OHSecureBrowser':
    ensure => installed,
  }

  file { 'C:/Documents and Settings/All Users/Desktop/OHSecureBrowser6.3.lnk':
    ensure  => 'absent',
  }

  file { "C:/Documents and Settings/All Users/Desktop/OHSecureBrowser.lnk":
    ensure => 'file',
    mode   => '0660',
    owner  => 'Administrator',
    group  => 'Administrators',
    source => 'puppet:///modules/nacs_management/OHSecureBrowser.lnk',
  }

}
