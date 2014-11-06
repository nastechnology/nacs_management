# == Defintion: nacs_management::map::admj
#
# This creates an .afploc file on the users desktop
# for admin J
#
# == Parameters
#  - The $server is the server the share is on
#  - The $username is the place for the desktop shortcut
#
# == Actions
#  - Creates afploc file for network j drive
#
# === Examples
#
# nacs_management::map::admj{ '100XXXXKDrive':
#   server => 'server.domain.local',
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
define nacs_management::map::admj {
  $user = $name
  $server = "adm-fs.nasadm.local"
  $share = "shared"

  file { "/Users/${user}/Desktop/JDrive.afploc":
    ensure  => file,
    content => template("nacs_management/afploc.erb"),
    unless  => "/bin/test -e /Users/${user}/Desktop/JDrive.afploc",
  }

  nacs_management::chdesktopicon { 'JDrive.afploc':
    user => $user,
  }

}
