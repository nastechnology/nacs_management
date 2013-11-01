# == Class: nacs_management::screen::1024x768
#
# This class takes all specific facts and district custom facts
# and stores them in a plist or in the registry for easy retrieval
# when needed for inventory purposes when doing an audit
#
# === Examples
#
# include nacs_management::screen
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::screen::1024x768 {
  if( $::productname == 'E4610'){
    registry::value { 'DefaultSettings.XResolution':
      key  => 'HKCC\System\CurrentControlSet\Services\iAlm\Device0\Mon80861100',
      type => dword,
      data => '1024',
    }

    registry::value { 'DefaultSettings.YResolution':
      key  => 'HKCC\System\CurrentControlSet\Services\iAlm\Device0\Mon80861100',
      type => dword,
      data => '768',
    }
  }
}
