# == Class: nacs_management::oaascreen
#
# This is the basic setup for nacs_management and creates the NACSManage
# directory on all NACS support Operating Systems.
#
# === Examples
#
# include nacs_management::oaascreen
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::oaascreen {
  if ($::operatingsystem == 'windows') {
    file { 'C:/NACSManage/dccmd.exe':
      ensure  => 'present',
      source  => 'puppet:///modules/nacs_management/dccmd.exe',
      mode    => '0777',
      owner   => 'Everyone',
      group   => 'Everyone',
      replace => true,
    }

    file { 'C:/NACSManage/dc.exe':
      ensure  => present,
      source  => 'puppet:///modules/nacs_management/dc.exe',
      mode    => '0777',
      owner   => 'Everyone',
      group   => 'Everyone',
      replace => true,
    }

    file { 'C:/NACSManage/changescreensize.bat':
      ensure  => 'present',
      source  => 'puppet:///modules/nacs_management/changescreensize.bat',
      mode    => '0777',
      owner   => 'Administrator',
      group   => 'Administrators',
      replace => false,
    }
  }
}
