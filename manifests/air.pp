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

      exec { 'DisableSpaces':
        command => "defaults write /Library/Preferences/com.apple.dock mcx-expose-disabled -bool TRUE",
      }

      #exec { 'RestartDock':
      #  command => "defaults write /Library/Preferences/com.apple.dock mcx-expose-disabled -bool TRUE",
      #}

      package { 'OHSecureBrowser6.3':
        provider => pkgdmg,
        source   => 'http://tech.napoleonareaschools.org/wp-content/uploads/2014/03/OHSecureBrowser-6.3.dmg',
        ensure   => 'installed',
      }
    }
  }
}
