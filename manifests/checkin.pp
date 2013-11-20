# == Class: nacs_management::checkin
#
# Uses the districts checkin API to checkin with the server 
# and is scheduled to run with every puppet run
#
# === Examples
#
# include nacs_management::checkin
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::checkin {

  case $operatingsystem {
    'Darwin', 'Ubuntu': {
      $checkinfile = '/opt/NACSManage/checkin.sh'
      $command = '/bin/bash /opt/NACSManage/checkin.sh'
      $owner = 'technology'
      $group = 'staff'
      $template = 'nonwindows_checkin.erb'
    }
    default: {
      $checkinfile = "C:/NACSManage/checkin.bat"
      $command = "cmd.exe /c C:/NACSManage/checkin.bat"
      $owner = 'Administrator'
      $group = 'Administrators'
      $template = 'windows_checkin.erb'
    }
  }

  if(!$ipaddress =~ /^10.20/){
    file { $checkinfile:
      ensure  => file,
      owner   => $owner,
   	  group   => $group,
   	  mode    => 0755,
   	  content => template("nacs_management/$template"),
    }

    exec { "Checkin":
   	  command => $command,
   	  require => File[$checkinfile],
    }
  }
}
