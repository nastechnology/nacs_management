# == Defintion: nacs_management::map::idrive
#
# This creates an .afploc file on the users desktop
# for their I drives
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
# nacs_management::mapidrive{ '100XXXX':
#   server => 'server.domain.local'
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
define nacs_management::map::idrive ($server = 'nas-fs.nas.local') {
  $user = $name
  $share = "${user}$"
  
  file { "/Users/${user}/Desktop/IDrive.afploc":
    ensure  => file,
    content => template("nacs_management/afploc.erb"),
  }

}