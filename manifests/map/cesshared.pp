# == Defintion: nacs_management::map::cesshared
#
# This creates an .afploc file on the users desktop
# for cesshared shared drive
#
# == Parameters
#  - The $user is the place for the desktop shortcut
#
# == Actions
#  - Creates afploc file for network ces shared drive
#
# === Examples
#
# nacs_management::map::cesshared{ '100XXXXCESShared':
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
define nacs_management::map::cesshared {
  $user = $name
  $server = "nas-fs.nas.local"
  $share = "ces_shared"

  file { "/Users/${user}/Desktop/CESShared.afploc":
    ensure  => file,
    content => template("nacs_management/afploc.erb"),
  }

  nacs_management::chdesktopicon { 'CESShared.afploc':
    user => $user,
  }

}
