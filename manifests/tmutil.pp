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

  class { "tmutil":
    user     => $userbackup,
    password => 'backup',
    server   => 'xserve.nacswildcats.org',
  }


  tmutil::exclude { "/Users/${user}/Desktop": }

  tmutil::exclude {"/Users/${user}/Downloads":
    require => Exec["Remove${userbackup}Desktop"],
  }

  if $::dropbox {
    tmutil::exclude {"/Users/${user}/Dropbox": }
  }

  if $::googledrive {
    tmutil::exclude {"/Users/${user}/Google\ Drive": }
  }

  if $::skydrive {
    tmutil::exclude {"/Users/${user}/SkyDrive": }
  }

  tmutil::exclude {"/Users/${user}/Library":
    #unless  => "/usr/bin/tmutil isexcluded /Users/${user}/Library | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
    require => Exec["Remove${userbackup}Downloads"],
  }

  tmutil::exclude {"/Users/${user}/Movies":
    #unless  => "/usr/bin/tmutil isexcluded /Users/${user}/Movies | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
    require => Exec["Remove${userbackup}Library"],
  }

  tmutil::exclude {"/Users/${user}/Music":
    #unless  => "/usr/bin/tmutil isexcluded /Users/${user}/Music | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
    require => Exec["Remove${userbackup}Movies"],
  }

  tmutil::exclude {"/Users/${user}/Pictures":
    #unless  => "/usr/bin/tmutil isexcluded /Users/${user}/Pictures | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
    require => Exec["Remove${userbackup}Music"],
  }

  if $::virtualbox {
    tmutil::exclude {"/Users/${user}/VirtualBox\ VMs": }
  }

  tmutil::exclude {"/Applications":
  #  unless  => "/usr/bin/tmutil isexcluded /Applications | if [ `grep -c 'Excluded'` == 1 ]; then echo 1; fi",
  #  require => Exec["Remove${userbackup}Applications"],
  }

  tmutil::exclude {" /System": }

  tmutil::exclude {"/Library": }

  tmutil::exclude {"/var": }

  tmutil::exclude {"/etc": }

  tmutil::exclude {"/bin": }

  #exec { "RemoveCores":
  #  command => "/usr/bin/tmutil addexclusion /cores",
  #}

  tmutil::exclude {"/usr": }

  tmutil::exclude {"/tmp": }

  #exec { "RemoveDev":
  #  command => "/usr/bin/tmutil addexclusion /dev",
  #}

  #exec { "RemoveTemp":
  #  command => "/usr/bin/tmutil addexclusion /temp",
  #}

  #exec { "RemoveHome":
  #  command => "/usr/bin/tmutil addexclusion /home",
  #}

  tmutil::exclude {"/opt": }

  #exec { "RemoveNet":
  #  command => "/usr/bin/tmutil addexclusion /net",
  #}

  tmutil::exclude {"/private": }

  tmutil::exclude {"/sbin": }

  tmutil::exclude {"/Volumes": }

  tmutil::exclude {"/Network": }
}
