# == Class: nacs_management
#
# This is the basic setup for nacs_management and creates the NACSManage
# directory on all NACS support Operating Systems.
#
# === Examples
#
# include nacs_management
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management {

    if ($operatingsystem == 'Darwin') or ($operatingsystem == 'Ubuntu'){
	  file {"/opt/NACSManage":
        ensure  => directory,
        owner   => "technology",
        group   => "staff",
        mode    => 0755,
	  }

      if($operatingsystem == 'Darwin'){
        file {'/Library/Preferences/com.apple.loginwindow.plist':
          ensure => present,
	      owner => root,
	      group => admin,
	    }

        exec { 'HideTechUser':
          command => "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add technology technologydepartment",
        }	

        exec {'Hide sub-500 users':
          command => "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool TRUE",
        }

	    property_list_key { 'LoginwindowText':
	        ensure => present,
	        path   => '/Library/Preferences/com.apple.loginwindow.plist',
	        key    => 'LoginwindowText',
	        value  => "Property of Napoleon Area City Schools, if found call 419-599-7015",
	    }
		
	    # Disable Gatekeeper in 10.8
	    property_list_key { 'Disable Gatekeeper':
	      ensure => present,
	      path   => '/var/db/SystemPolicy-prefs.plist',
	      key    => 'enabled',
	      value  => 'no',
	    }
      }
    } else {
	  # Assumes Windows - for now
	  file { "C:/NACSManage":
        ensure => directory,
        owner  => 'Everyone',
        group  => 'Everyone',
        mode   => 0777,
      }
    }
}
