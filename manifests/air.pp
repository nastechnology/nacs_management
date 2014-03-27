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

  case $::operatingsystem {
    'windows': {
      package { 'OHSecureBrowser':
        ensure => installed,
      }
    }
    'Darwin': {
      package { '':
        provider => pkgdmg,
        source   => 'http://oh.portal.airast.org/oh_fieldtest/wp-content/uploads/secure_browsers/OHSecureBrowser6.3-OSX.dmg',
        ensure   => 'installed',
      }
    }
  }
}
