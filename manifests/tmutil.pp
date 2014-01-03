# == Defintion: nacs_management::tmutil
#
# A type that takes a users name
#
# == Parameters
#  - The $user to backup just the documents
#
# == Actions
#  - Adds time machine configuration to computer
#
# === Examples
#
# nacs_management::tmutil{ '100XXXX': }
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
define nacs_management::tmutil ($user = $name) {  
  $userbackup = "${user}B"

  exec { "EnableTmutil":
    command => "/usr/bin/tmutil enable",
  }

  exec { "Set${userbackup}Destination":
    command => "/usr/bin/tmutil setdestination afp://${userbackup}:backup@xserve.nacswildcats.org/TimeMachines",
    after   => Exec['EnableTmutil'],
  }

  exec { "Remove${userbackup}Desktop":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Desktop",
    after   => Exec["Set${userbackup}Destination"],
  }

  exec { "Remove${userbackup}Downloads":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Downloads",
    after   => Exec["Remove${userbackup}Desktop"],
  }

  exec { "Remove${userbackup}Dropbox":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Dropbox",
    after   => Exec["Remove${userbackup}Downloads"],
  }

  exec { "Remove${userbackup}GoogleDrive":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Google\ Drive",
    after   => Exec["Remove${userbackup}Dropbox"],
  }

  exec { "Remove${userbackup}SkyDrive":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/SkyDrive",
    after   => Exec["Remove${userbackup}GoogleDrive"],
  }

  exec { "Remove${userbackup}Library":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Library",
    after   => Exec["Remove${userbackup}SkyDrive"],
  }

  exec { "Remove${userbackup}Movies":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Movies",
    after   => Exec["Remove${userbackup}Library"],
  }

  exec { "Remove${userbackup}Music":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Music",
    after   => Exec["Remove${userbackup}Movies"],
  }

  exec { "Remove${userbackup}Pictures":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Pictures",
    after   => Exec["Remove${userbackup}Music"],
  }

  exec { "Remove${userbackup}VirtualBoxVMs":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/VirtualBox\ VMs",
    after   => Exec["Remove${userbackup}Pictures"],
  }

  exec { "Remove${userbackup}Applications":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Applications",
    after   => Exec["Remove${userbackup}VirtualBoxVMs"],
  }

  exec { "RemoveApplications":
    command => "/usr/bin/tmutil addexclusion /Applications",
    after   => Exec["Remove${userbackup}Applications"],
  }
}