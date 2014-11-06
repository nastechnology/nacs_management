# == Defintion: nacs_management::map::admk
#
# This creates an .afploc file on the users desktop
# for admin K
#
# == Parameters
#  - The $server is the server the share is on
#  - The $username is the place for the desktop shortcut
#
# == Actions
#  - Creates afploc file for network i drive
#
# === Examples
#
# nacs_management::map::admk{ '100XXXXKDrive':
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
define nacs_management::map::admk {
  $user = $name
  $server = "adm-fs.nasadm.local"
  $share = "district"

  file { "/Users/${user}/Desktop/KDrive.afploc":
    ensure  => file,
    content => template("nacs_management/afploc.erb"),
    unless  => "/bin/test -e /Users/${user}/Desktop/KDrive.afploc",
  }

  nacs_management::chdesktopicon { 'KDrive.afploc':
    user => $user,
  }

}
