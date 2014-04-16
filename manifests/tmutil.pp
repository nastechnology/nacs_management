# == Definition: nacs_management::tmutil
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
    require => Exec['EnableTmutil'],
  }

  exec { "Remove${userbackup}Desktop":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Desktop",
    #unless  => "/usr/bin/tmutil isexcluded /Users/${user}/Desktop | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
    require => Exec["Set${userbackup}Destination"],
  }

  exec { "Remove${userbackup}Downloads":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Downloads",
    #unless  => "/usr/bin/tmutil isexcluded /Users/${user}/Downloads | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
    require => Exec["Remove${userbackup}Desktop"],
  }

  if $::dropbox {
    exec { "Remove${userbackup}Dropbox":
     command => "/usr/bin/tmutil addexclusion /Users/${user}/Dropbox",
    }
  }

  if $::googledrive {
    exec { "Remove${userbackup}GoogleDrive":
      command => "/usr/bin/tmutil addexclusion /Users/${user}/Google\ Drive",
    }
  }

  if $::skydrive {
    exec { "Remove${userbackup}SkyDrive":
      command => "/usr/bin/tmutil addexclusion /Users/${user}/SkyDrive",
    }
  }

  exec { "Remove${userbackup}Library":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Library",
    #unless  => "/usr/bin/tmutil isexcluded /Users/${user}/Library | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
    require => Exec["Remove${userbackup}Downloads"],
  }

  exec { "Remove${userbackup}Movies":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Movies",
    #unless  => "/usr/bin/tmutil isexcluded /Users/${user}/Movies | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
    require => Exec["Remove${userbackup}Library"],
  }

  exec { "Remove${userbackup}Music":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Music",
    #unless  => "/usr/bin/tmutil isexcluded /Users/${user}/Music | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
    require => Exec["Remove${userbackup}Movies"],
  }

  exec { "Remove${userbackup}Pictures":
    command => "/usr/bin/tmutil addexclusion /Users/${user}/Pictures",
    #unless  => "/usr/bin/tmutil isexcluded /Users/${user}/Pictures | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
    require => Exec["Remove${userbackup}Music"],
  }

  if $::virtualbox {
    exec { "Remove${userbackup}VirtualBoxVMs":
      command => "/usr/bin/tmutil addexclusion /Users/${user}/VirtualBox\ VMs",
    }
  }

  #exec { "Remove${userbackup}Applications":
  #  command => "/usr/bin/tmutil addexclusion /Users/${user}/Applications",
  #  require => Exec["Remove${userbackup}VirtualBoxVMs"],
  #}

  exec { "RemoveApplications":
    command => "/usr/bin/tmutil addexclusion /Applications",
  #  unless  => "/usr/bin/tmutil isexcluded /Applications | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
  #  require => Exec["Remove${userbackup}Applications"],
  }

  exec { "RemoveSystem":
    command => "/usr/bin/tmutil addexclusion /System",
  }

  exec { "RemoveLibrary":
    command => "/usr/bin/tmutil addexclusion /Library",
  }

  exec { "RemoveVar":
    command => "/usr/bin/tmutil addexclusion /var",
  }

  exec { "RemoveEtc":
    command => "/usr/bin/tmutil addexclusion /etc",
  }

  exec { "RemoveBin":
    command => "/usr/bin/tmutil addexclusion /bin",
  }

  exec { "RemoveCores":
    command => "/usr/bin/tmutil addexclusion /cores",
  }

  exec { "RemoveUsr":
    command => "/usr/bin/tmutil addexclusion /usr",
  }

  exec { "RemoveTmp":
    command => "/usr/bin/tmutil addexclusion /tmp",
  }

  exec { "RemoveDev":
    command => "/usr/bin/tmutil addexclusion /dev",
  }

  exec { "RemoveTemp":
    command => "/usr/bin/tmutil addexclusion /temp",
  }

  exec { "RemoveHome":
    command => "/usr/bin/tmutil addexclusion /home",
  }

  exec { "RemoveOpt":
    command => "/usr/bin/tmutil addexclusion /opt",
  }

  exec { "RemoveNet":
    command => "/usr/bin/tmutil addexclusion /net",
  }

  exec { "RemovePrivate":
    command => "/usr/bin/tmutil addexclusion /private",
  }

  exec { "RemoveSbin":
    command => "/usr/bin/tmutil addexclusion /sbin",
  }

  exec { "RemoveVolumes":
    command => "/usr/bin/tmutil addexclusion /Volumes",
  }

  exec { "RemoveNetwork":
    command => "/usr/bin/tmutil addexclusion /Network",
  }
}
