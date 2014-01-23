# == Defintion: nacs_management::map::cdbshared
#
# This creates an .afploc file on the users desktop
# for cdbshared shared drive
#
# == Parameters
#  - The $user is the place for the desktop shortcut
#
# == Actions
#  - Creates afploc file for network cdb shared drive
#
# === Examples
#
# nacs_management::map::cdbshared{ '100XXXXCDBShared':
#   user   => '100XXXX'
# }
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
define nacs_management::map::cdbshared ($user) {
  $server = "nas-fs.nas.local"
  $share = "cdb_shared"
  
  file { "/Users/${user}/Desktop/CDBShared.afploc":
    ensure  => file,
    content => template("nacs_management/afploc.erb"),
  }

  nacs_management::chdesktopicon { 'CDBShared.afploc':
    user => $user,
  }

}