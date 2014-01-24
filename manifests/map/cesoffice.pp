# == Defintion: nacs_management::map::cesoffice
#
# This creates an .afploc file on the users desktop
# for central_office
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
# nacs_management::map::cesoffice{ '100XXXXKDrive':
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
define nacs_management::map::cesoffice {
  $user = $name
  $server = "adm-fs.nasadm.local"
  $share = "district"
  
  file { "/Users/${user}/Desktop/CESOfficeDrive.afploc":
    ensure  => file,
    content => template("nacs_management/afploc.erb"),
  }
  
  nacs_management::chdesktopicon { 'CESOfficeDrive.afploc':
    user => $user,
  }

}