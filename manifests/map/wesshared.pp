# == Defintion: nacs_management::map::wesshared
#
# This creates an .afploc file on the users desktop
# for wesshared share drive
#
# == Parameters
#  - The $user is the place for the desktop shortcut
#
# == Actions
#  - Creates afploc file for network i drive
#
# === Examples
#
# nacs_management::map::wesshared{ '100XXXXNHSShared':
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
define nacs_management::map::wesshared ($user) {
  $server = "nas-fs.nas.local"
  $share = "wes_shared"
  
  file { "/Users/${user}/Desktop/WESShared.afploc":
    ensure  => file,
    content => template("nacs_management/afploc.erb"),
  }

  nacs_management::chdesktopicon { 'WESShared.afploc':
    user => $user,
  }

}