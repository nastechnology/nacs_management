# == Defintion: nacs_management::map::nmsshared
#
# This creates an .afploc file on the users desktop
# for nmsshared share drive
#
# == Parameters
#  - The $user is the place for the desktop shortcut
#
# == Actions
#  - Creates afploc file for network i drive
#
# === Examples
#
# nacs_management::map::nmsshared{ '100XXXXNHSShared':
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
define nacs_management::map::nmsshared ($user) {
  $server = "nas-fs.nasadm.local"
  $share = "nms_shared"
  
  file { "/Users/${user}/Desktop/NMSShared.afploc":
    ensure  => file,
    content => template("nacs_management/afploc.erb"),
  }

}