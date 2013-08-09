
# == Class: nacs_management::mapdrive::nhsshared
#
# Map nhsshared drive for Mac OS X
#
# === Examples
#
# include nacs_management::mapdrive::nhsshared
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::defaultprinter($server,$printer) {

    file { "C:\NACSManage\defaultprint.reg":
        ensure  => file,
	owner	=> 'Everyone',
	group 	=> 'Administrators',
	mode	=> '0777',
   	content => template("nacs_management/defaultprinter.erb"),
    }

    exec { 'setdefaultprintperms':
	command => 'C:\SetACL.exe -on "C:\NACSManage\defaultprint.reg" -ot file -actn ace -ace "n:Everyone;p:full"',
	require => File['C:\NACSManage\defaultprint.reg'],
    }
}
