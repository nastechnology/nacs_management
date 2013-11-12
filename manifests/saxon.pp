# == Class: nacs_management::saxon
#
# Install Saxon Test Generator for Math Teachers
#
# === Examples
#
# include nacs_management::saxon
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::saxon {
  if ($operatingsystem == 'windows'){
    $pkg = 'SaxonTestGenerator'

    file { 'C:/WINDOWS/system/MFCOLEUI.DLL':
      ensure  => 'file',
      replace => 'no',
      owner   => 'SYSTEM',
      group   => 'Administrators',
      mode    => '0755',
      source  => 'puppet:///modules/nacs_management/MFCOLEUI.DLL',
    }

    exec { 'SetMFCOLEUIPerms':
      command => 'C:\SetACL.exe -on "C:\WINDOWS\system\MFCOLEUI.DLL" -ot file -actn ace -ace "n:Everyone;p:full"',
      require => File['C:/WINDOWS/system/MFCOLEUI.DLL'],
    }

    package { $pkg:
      ensure  => 'installed',
    }

    file { "C:\Saxon.zip":
      ensure  => 'absent',
      require => Exec['ChangeSaxonPerms'],
    }

    exec { 'ChangeSaxonPerms':
      command => 'C:\SetACL.exe -on "C:\Saxon" -ot file -actn ace -ace "n:Everyone;p:full"',
      require => Package['SaxonTestGenerator'],
    }

    file { 'C:/Documents and Settings/All Users/Desktop/Saxon Test Generator.lnk':
      ensure => 'file',
      source => 'puppet:///modules/nacs_management/Saxon Test Generator.lnk',
    }

    file { 'C:/Documents and Settings/All Users/Desktop/Equation Editor.lnk':
      ensure => 'file',
      source => 'puppet:///modules/nacs_management/Equation Editor.lnk',
    }
  }
}
