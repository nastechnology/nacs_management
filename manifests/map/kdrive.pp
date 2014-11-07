# == Defintion: nacs_management::map::kdrive
#
# This creates an .afploc file on the users desktop
# for the k drive on nas-fs
#
# == Parameters
#  - The $username is the place for the desktop shortcut
#
# == Actions
#  - Creates afploc file for network k drive
#
# === Examples
#
# nacs_management::map::kdrive{ '100XXXXKdrive':
#   user => '100XXXX'
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
define nacs_management::map::kdrive {
  $user = $name
  file { "/Users/${user}/Desktop/KDrive.afploc":
    ensure  => file,
    content => template("nacs_management/afploc.erb"),
  }

  nacs_management::chdesktopicon { 'KDrive.afploc':
    user => $user,
  }
}
