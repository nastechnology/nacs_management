
# == Class: nacs_management::examview::historyto1877
#
# Install ExamView for NMS Social Studies Teachers
#
# === Examples
#
# include nacs_management::examview::historyto1877
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::examview::historyto1877 {

    $pkg = 'examview.historyto1877'

    package { $pkg:
    	ensure  => installed,
    }

    file { "C:\ExamView.zip":
	ensure  => absent,
	require => Exec['ChangeEVHistoryto1877Perms'],
	backup  => false,
    }

    exec { 'ChangeEVHistoryto1877Perms':
	command => 'C:\SetACL.exe -on "C:\ExamView" -ot file -actn ace -ace "n:Everyone;p:full"',
	require => Package['examview.historyto1877'],
    }
    
}
