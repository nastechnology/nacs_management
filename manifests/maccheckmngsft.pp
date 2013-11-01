class nacs_management::maccheckmngsft {
  exec { '/usr/local/munki/managedsoftwareupdate':
    alias => 'munkidownload'
  }

  exec { '/usr/local/munki/managedsoftwareupdate --installonly':
    require => Exec['munkidownload']
  }
}
