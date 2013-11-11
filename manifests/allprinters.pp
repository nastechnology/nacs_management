# == Defintion: nacs_management::printers
#
# A type that takes a printer name
#
# == Parameters
#  - The $name of the printer to install
#
# == Actions
#  - Adds printer to the computer
#
# === Examples
#
# nacs_management::printers{ 'nhs_copier': }
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::allprinters {
  package { 'Kyocera_OS_X_10.5_Web_build_2012.11.30.dmg':
    provider => pkgdmg,
    source   => 'http://tech.napoleonareaschools.org/Kyocera_OS_X_10.5_Web_build_2012.11.30.dmg',
    ensure   => installed,
  } 

  package { 'foomatic-rip-4.0.6.230.dmg':
    provider => pkgdmg,
    source   => 'http://tech.napoleonareaschools.org/foomatic-rip-4.0.6.230.dmg',
    ensure   => installed,
  }

  package { 'gplgs-8.71.dmg':
    provider => pkgdmg,
    source   => 'http://tech.napoleonareaschools.org/gplgs-8.71.dmg',
    ensure   => installed,
    require  => Package['foomatic-rip-4.0.6.230.dmg']
  }

  package { 'pxlmono-1.9.dmg':
    provider => pkgdmg,
    source   => 'http://tech.napoleonareaschools.org/pxlmono-1.9.dmg',
    ensure   => installed,
    require  => Package['gplgs-8.71.dmg']
  }

}