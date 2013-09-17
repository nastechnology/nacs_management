
# == Class: nacs_management::examview::algebra1
#
# Install ExamView Algebra 1 
#
# === Examples
#
# include nacs_management::examview::algebra1
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::examview::algebra1 {

    $pkg = 'examview.algebra1'

    package { $pkg:
    	ensure  => installed,
    }

#    file { "C:\ExamView.zip":
#	ensure  => absent,
#	require => Exec['ChangeEVAlgebra1Perms'],
#	backup  => false,
#    }

    exec { 'ChangeEVAlgebra1Perms':
	command => 'C:\SetACL.exe -on "C:\ExamView" -ot file -actn ace -ace "n:Everyone;p:full"',
	require => Package['examview.algebra1'],
    }
    
}
