# == Class: nacs_management::sirsi
#
# This class installs Sirsi to computers using the
# chocolatey provider and configures the computer to
# use the correct configuration
#
# === Examples
#
# include nacs_management::sirsi
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::sirsi {
  $pkg = 'SirsiWorkflows'

  package { $pkg:
    ensure  => 'installed',
  }

  exec { 'ChangeSirsiPerms':
    command => 'C:\SetACL.exe -on "C:\Program Files\Sirsi" -ot file -actn ace -ace "n:Everyone;p:full"',
    require => Package['SirsiWorkflows'],
  }

  file { 'C:/WINDOWS/Fonts/free3of9 barcode font.ttf':
    ensure  => 'file',
    owner   => 'SYSTEM',
    group   => 'Users',
    mode    => '0777',
    source  => 'puppet:///modules/nacs_management/free3of9 barcode font.ttf',
    require => Exec['ChangeSirsiPerms'],
  }
}
