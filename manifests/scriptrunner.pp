# == Class: nacs_management::scriptrunner
#
# This class installs the scriptrunner python script for macs
#
# === Examples
#
# include nacs_management::scriptrunner
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2014 Mark Myers, unless otherwise noted.
#
class nacs_management::scriptrunner {
  package { 'scriptRunnerPkg-1.3.dmg':
    provider => pkgdmg,
    source   => 'http://tech.napoleonareaschools.org/wp-content/uploads/2014/01/scriptRunnerPkg-1.3.dmg',
    ensure   => installed,
  }	

  file { '/opt/NACSManage/scriptRunner':
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => 0755,
  }

  file { '/opt/NACSManage/scriptRunner/once':
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => 0755,
  }

  file { '/opt/NACSManage/scriptRunner/every':
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => 0755,
  }


}