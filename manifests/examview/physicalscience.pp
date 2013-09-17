
# == Class: nacs_management::examview::physicalscience
#
# Install ExamView for NHS Physcial Science Teachers
#
# === Examples
#
# include nacs_management::examview::physicalscience
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::examview::physicalscience {

    $pkg = 'examview.physicalscience'

    package { $pkg:
    	ensure  => installed,
    }

    file { "C:\ExamView.zip":
	ensure  => absent,
	require => Exec['ChangeEVPhysicalSciencePerms'],
	backup  => false,
    }

    exec { 'ChangeEVPhysicalSciencePerms':
	command => 'C:\SetACL.exe -on "C:\ExamView" -ot file -actn ace -ace "n:Everyone;p:full"',
	require => Package['examview.physicalscience'],
    }
    
}
