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

  if ($::operatingsystem == 'Darwin') or ($::operatingsystem == 'Ubuntu'){
    if($::operatingsystem == 'Ubuntu'){
      $group = 'root'
    } else {
      $group = 'wheel'
    }
    file { '/opt':
      ensure => directory,
      owner  => 'root',
      group  => $group,
      mode   => '0755',
    }

    file { '/opt/NACSManage':
      ensure  => directory,
      owner   => 'root',
      group   => $group,
      mode    => '0755',
      require => File['/opt'],
    }

    if($::operatingsystem == 'Darwin'){
      $logintext = 'Property of Napoleon Area City Schools, if found call 419-599-7015'

      file { '/etc/facter':
        ensure  => directory,
        owner   => 'root',
        group   => 'wheel',
        mode    => '0755',
      }

      file { '/etc/facter/facts.d':
        ensure  => directory,
        owner   => 'root',
        group   => 'wheel',
        mode    => '0777',
      }

      file {'/Library/Preferences/com.apple.loginwindow.plist':
        ensure => present,
        owner  => 'root',
        group  => 'wheel',
      }

      file {'/opt/NACSManage/isinstalled.sh':
        ensure => present,
        owner  => 'root',
        group  => 'wheel',
        mode   => '0755',
        source => 'puppet:///modules/nacs_management/isinstalled.sh',
      }

      file { '/opt/NACSManage/logintext':
        ensure => present,
        owner  => 'root',
        group  => 'wheel',
        mode   => '0755',
        source => 'puppet:///modules/nacs_management/logintext',
      }

      file { '/opt/NACSManage/ipcheck':
        ensure => present,
        owner  => 'root',
        group  => 'wheel',
        mode   => '0755',
        source => 'puppet:///modules/nacs_management/ipcheck',
      }

      file { '/Library/LaunchDaemons/org.nacswildcats.nacsmanage.ipcheck.plist':
        ensure  => present,
        owner   => 'root',
        group   => 'wheel',
        mode    => '0755',
        source  => 'puppet:///modules/nacs_management/org.nacswildcats.nacsmanage.ipcheck.plist',
        require => File['/opt/NACSManage/ipcheck'],
      }

      exec { 'LaunchDaemonIPCheck':
        command => '/bin/launchctl load -w /Library/LaunchDaemons/org.nacswildcats.nacsmanage.ipcheck.plist',
        unless  => '/bin/launchctl list | grep -c org.nacswildcats.nacsmanage.ipcheck',
      }

      if($::is_new == 'true') {
        exec { 'HideTechUserNew':
          command => "defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add technology technologydepartment",
        }

        exec {'Hide sub-500 users New':
          command => "defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool TRUE",
        }

        exec { 'LoginwindowTextNew':
          command  => '/opt/NACSManage/logintext',
        }

        # Disable Gatekeeper in 10.8
        exec { 'DisableGatekeeperNew':
          command => '/usr/sbin/spctl --master-disable',
        }

        file { '/opt/NACSManage/new.txt':
          ensure => absent,
        }

      }

      exec { 'HideTechUser':
        command => "defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add technology technologydepartment",
        unless  => "defaults read /Library/Preferences/com.apple.loginwindow HiddenUsersList | if [ `grep -c technology` > 0 ]; then exit 0; fi",
      }

      exec {'Hide sub-500 users':
        command => "defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool TRUE",
        unless  => "defaults read /Library/Preferences/com.apple.loginwindow Hide500Users | if [ `grep 1` == 1 ]; then exit 0; fi",
      }

      exec { 'LoginwindowText':
        command => '/opt/NACSManage/logintext',
        creates => '/opt/NACSManage/logintext.txt',
      }

      unless $::gatekeeper == 0 {
        # Disable Gatekeeper in 10.8
        exec { 'DisableGatekeeper':
          command => '/usr/sbin/spctl --master-disable',
        }
      }
    }
  } else {
    # Assumes Windows - for now
    file { "C:/NACSManage":
      ensure => directory,
      owner  => 'Administrator',
      group  => 'Administrators',
      mode   => '0777',
    }

    file { "C:/NACSManage/whoami.exe":
      ensure  => file,
      source  => 'puppet:///modules/nacs_management/whoami.exe',
      require => File['C:/NACSManage'],
    }

    file { "C:/NACSManage/set-shortcut.ps1":
      ensure => file,
      source => 'puppet:///modules/nacs_management/set-shortcut.ps1',
      require => File['C:/NACSManage'],
    }
  }
}
