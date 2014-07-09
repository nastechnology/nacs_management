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

  tmutil::exclude {"/Users/${user}/Downloads": }

  if $::dropbox {
    tmutil::exclude {"/Users/${user}/Dropbox": }
  }

  if $::googledrive {
    tmutil::exclude {"/Users/${user}/Google\ Drive": }
  }

  if $::skydrive {
    tmutil::exclude {"/Users/${user}/SkyDrive": }
  }

  tmutil::exclude {"/Users/${user}/Library": }

  tmutil::exclude {"/Users/${user}/Movies": }

  tmutil::exclude {"/Users/${user}/Music": }

  tmutil::exclude {"/Users/${user}/Pictures": }

  if $::virtualbox {
    tmutil::exclude {"/Users/${user}/VirtualBox\ VMs": }
  }

  tmutil::exclude {"/Applications": }

  tmutil::exclude {" /System": }

  tmutil::exclude {"/Library": }

  tmutil::exclude {"/var": }

  tmutil::exclude {"/etc": }

  tmutil::exclude {"/bin": }

  tmutil::exclude {"/usr": }

  tmutil::exclude {"/tmp": }

  tmutil::exclude {"/private": }

  tmutil::exclude {"/sbin": }

  tmutil::exclude {"/Volumes": }

  tmutil::exclude {"/Network": }
}
