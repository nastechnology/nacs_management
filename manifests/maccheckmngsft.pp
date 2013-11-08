class nacs_management::maccheckmngsft {
  exec { '/usr/local/munki/managedsoftwareupdate':
    alias => 'munkidownload'
  }

  exec { '/usr/local/munki/managedsoftwareupdate --installonly':
    require => Exec['munkidownload']
  }

  exec { 'RunClientIdentifier':
    command => "/usr/bin/defaults write /Library/Preferences/ManagedInstalls ClientIdentifier '${hostname}.nas.local'"
  }
}
