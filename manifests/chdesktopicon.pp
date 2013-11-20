# == Defintion: nacs_management::chdesktopicon
#
# Changes the icon of the file passed in for the user
#
# == Parameters
#  - The $username is the place for the desktop shortcut
#  - The $file
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
define nacs_management::chdesktopicon ($user,$file = $name) {

  exec { "ChangeIcon${file}":
    command => "/opt/NACSManage/setfileicon '/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/InternetLocationGeneric.icns' '/Users/${user}/Desktop/${file}'",
    require => File["/Users/${user}/Desktop/${file}"],
  }
}