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
    file { '/opt':
      ensure => directory,
      owner  => 'technology',
      group  => 'staff',
      mode   => 0755,
    }
    
    file { '/opt/NACSManage':
      ensure  => directory,
      owner   => "technology",
      group   => "staff",
      mode    => 0755,
      require => File['/opt'],
    }

    if($operatingsystem == 'Darwin'){

      file { '/etc/facter':
        ensure  => directory,
        owner   => 'technology',
        group   => 'staff',
        mode    => 0755,
      }

      file { '/etc/facter/facts.d':
        ensure  => directory,
        owner   => 'root',
        group   => 'wheel',
        mode    => 0777,
      }

      file {'/Library/Preferences/com.apple.loginwindow.plist':
        ensure => present,
	      owner  => root,
	      group  => admin,
	    }

      exec { 'HideTechUser':
        command => "/usr/bin/defaults read /Library/Preferences/com.apple.loginwindow HiddenUsersList | if [ `grep -c 'technology'` == 0 ]; then /usr/bin/defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add technology technologydepartment; fi",
      }	

      exec {'Hide sub-500 users':
        command => "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool TRUE",
      }

      exec { 'LoginwindowText':
        command  => "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText 'Property of Napoleon Area City Schools, if found call 419-599-7015'",
      }

	    # Disable Gatekeeper in 10.8
	    #property_list_key { 'Disable Gatekeeper':
	    #  ensure => present,
	    #  path   => '/var/db/SystemPolicy-prefs.plist',
	    #  key    => 'enabled',
	    #  value  => 'no',
	    #}
       # Disable Gatekeeper in 10.8
            exec { 'Disable Gatekeeper':
              command  => '/usr/sbin/spctl --master-disable',
            }

    }
  } else {
    # Assumes Windows - for now
    file { "C:/NACSManage":
      ensure => directory,
      owner  => 'Administrator',
      group  => 'Administrators',
      mode   => 0777,
    }

    file { "C:/NACSManage/set-shortcut.ps1":
      ensure => file,
      source => 'puppet:///modules/nacs_management/set-shortcut.ps1',
    }
  }
}
