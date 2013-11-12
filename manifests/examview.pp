# == Class: nacs_management::examview
#
# Install ExamView Shortcuts for teachers that use ExamView
#
# === Examples
#
# include nacs_management::examview
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::examview {
  if ($operatingsystem == 'windows'){

	file { "C:\Documents and Settings\All Users\Desktop\ExamView Player.lnk":
	    ensure  => file,
	    source  => 'puppet:///modules/nacs_management/ExamView Player.lnk',
	}

	file { "C:\Documents and Settings\All Users\Desktop\ExamView Test Generator.lnk":
	    ensure => file,
	    source => 'puppet:///modules/nacs_management/ExamView Test Generator.lnk',
	}

	file { "C:\Documents and Settings\All Users\Desktop\ExamView Test Manager.lnk":
	    ensure => file,
	    source => 'puppet:///modules/nacs_management/ExamView Test Manager.lnk',
	}

  }
}
