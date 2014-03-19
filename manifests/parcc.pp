# == Class: nacs_management::parcc
#
# Uses the districts checkin API to checkin with the server
# and is scheduled to run with every puppet run
#
# === Examples
#
# include nacs_management::parcc
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::parcc {
  case $::operatingsystem{
    'windows': {
      file { 'C:/windows/sun':
        ensure => 'directory',
        mode   => '0660',
        owner  => 'Administrator',
        group  => 'Administrators',
      }

      file { 'C:/windows/sun/java':
        ensure  => 'directory',
        mode    => '0660',
        owner   => 'Administrator',
        group   => 'Administrators',
        require => File['C:/windows/sun'],
      }

      file { 'C:/windows/sun/java/deployment':
        ensure  => 'directory',
        mode    => '0660',
        owner   => 'Administrator',
        group   => 'Administrators',
        require => File['C:/windows/sun/java'],
      }

      file { 'C:/windows/sun/java/deployment/deployment.config':
        ensure  => 'file',
        mode    => '0660',
        owner   => 'Administrator',
        group   => 'Administrators',
        source  => 'puppet:///modules/nacs_management/deployment.config',
        require => File['C:/windows/sun/java/deployment']
      }

      file { 'C:/windows/sun/java/deployment/deployment.properties':
        ensure  => 'file',
        mode    => '0660',
        owner   => 'Administrator',
        group   => 'Administrators',
        source  => 'puppet:///modules/nacs_management/deployment.properties',
        require => File['C:/windows/sun/java/deployment']
      }

      file { 'C:/windows/sun/java/deployment/trusted.certs':
        ensure  => 'file',
        mode    => '0660',
        owner   => 'Administrator',
        group   => 'Administrators',
        source  => 'puppet:///modules/nacs_management/trusted.certs',
        require => File['C:/windows/sun/java/deployment']
      }
    }
  }
}