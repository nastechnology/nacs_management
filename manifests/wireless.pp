# == Defintion: nacs_management::wireless
#
# A type that takes a wireless name
#
# == Parameters
#  - The $name of the wireless to install
#
# == Actions
#  - Adds wireless config to the computer
#
# === Examples
#
# nacs_management::wireless{ 'teachers': }
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
define nacs_management::wireless ($wifi = $name) {   
  case $wifi {
    'staff': {
      package { 'staff_wireless_network.dmg':
        provider => pkgdmg,
        source   => 'http://tech.napoleonareaschools.org/wp-content/uploads/2013/12/staff_wireless_network.dmg',
        ensure   => installed,
      }
    }

    'teachers': {
      package { 'teacher_wireless_network.dmg':
        provider => pkgdmg,
        source   => 'http://tech.napoleonareaschools.org/wp-content/uploads/2013/12/teacher_wireless_network.dmg',
        ensure   => installed,
      }
    }
  }
}
