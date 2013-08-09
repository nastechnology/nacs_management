
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
        ensure  => absent,
    }

    exec { 'setdefaultprinter':
	command => 'RUNDLL32 PRINTUI.DLL,PrintUIEntry /y /n\\$server\$printer',
    }
}
