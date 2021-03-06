# == Defintion: nacs_management::map::shared
#
# This creates an .afploc file on the users desktop
# for boe shared drive
#
# == Parameters
#  - The $user is the place for the desktop shortcut
#
# == Actions
#  - Creates afploc file for network i drive
#
# === Examples
#
# nacs_management::map::shared{ '100XXXXShared':
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
define nacs_management::map::shared {
  $user = $name
  $server = "adm-fs.nasadm.local"
  $share = "shared"

  file { "/Users/${user}/Desktop/Shared.afploc":
    ensure  => file,
    content => template("nacs_management/afploc.erb"),
  }

  exec { 'ChangeIcon':
    command => "/opt/NACSManage/setfileicon '/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/InternetLocationGeneric.icns' '/Users/${user}/Desktop/Shared.afploc'",
    require => File["/Users/${user}/Desktop/Shared.afploc"],
  }

}
