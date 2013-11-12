# == Class: nacs_management::cm-trl
#
# Installs Consumer Mathematics Teacher Resource Library
#
# === Examples
#
# include nacs_management::cm-trl
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::cm-trl {
  if ($operatingsystem == 'windows'){
    package { 'CM_TRL':
      ensure => installed,
    }

    exec { 'SetCM_TRLPerms':
      command => 'C:\SetACL.exe -on "C:\CM_TRL" -ot file -actn ace -ace "n:Everyone;p:full"',
      require => Package['CM_TRL'],
    }

    file { "C:\Documents and Settings\All Users\Desktop\Consumer Mathematics Teacher Resource Library.lnk":
	  ensure => file,
      source => 'puppet:///modules/nacs_management/Consumer Mathematics Teacher Resource Library.lnk',
    }
  }
}
