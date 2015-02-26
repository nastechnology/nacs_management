# == Class: nacs_management::techspecs::win
#
# This class takes all specific facts and district custom facts
# and stores them in a plist or in the registry for easy retrieval
# when needed for inventory purposes when doing an audit
#
# == What is stored
#
# Building
# Computer Name
# Device Type
# Inventory Tag
# Room Number
# Serial Number
# MAC Address
# Memory
# Device Model
# Operating System
# Processor
#
# === Examples
#
# include nacs_management::techspecs::win
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::techspecs::win {

  registry_key {'32:HKLM\Software\NACSTech':
    ensure => present,
  }

  registry_value {'hklm\Software\NACSTech\RoomNumber':
    ensure => present,
    type   => string,
    data   => $::room,
  }

  registry_key { 'hklm\Software\NACSTech\RoomInv':
    ensure => present,
  }

  registry_value { 'hklm\Software\NACSTech\SerialNumber':
    ensure => present,
    type   => string,
    data   => $::serialnumber,
  }

  registry_key { 'hklm\Software\NACSTech\SystemSpecs':
    ensure => present,
  }

  registry_key { 'hklm\Software\NACSTech\Accessories\Monitors':
    ensure => present,
  }

  registry_key { 'hklm\Software\NACSTech\Accessories\Projectors':
    ensure => present,
  }

  registry_key { 'hklm\Software\NACSTech\Accessories\SMART':
    ensure => present,
  }

  registry_value { 'hklm\Software\NACSTech\SystemSpecs\MACAddress':
    ensure => present,
    type   => string,
    data   => $::macaddress,
  }

  registry_value { 'hklm\Software\NACSTech\SystemSpecs\OperatingSystem':
    ensure => present,
    type   => string,
    data   => $::operatingsystem,
  }

  registry_value { 'hklm\Software\NACSTech\SystemSpecs\Model':
    ensure => present,
    type   => string,
    data   => $::productname,
  }

  registry_value { 'hklm\Software\NACSTech\SystemSpecs\Processor':
    ensure => present,
    type   => string,
    data   => $::processor0,
  }

  registry_value { 'hklm\Software\NACSTech\SystemSpecs\Memory':
    ensure => present,
    type   => string,
    data   => $::memorytotal,
  }

  registry_value { 'hklm\Software\NACSTech\ComputerName':
    ensure => present,
    type   => string,
    data   => $::hostname,
  }

  registry_value {'hklm\Software\NACSTech\InventoryTag':
    ensure => present,
    type   => string,
    data   => $::inventory_tag,
  }

  registry_value { 'hklm\Software\NACSTech\Building':
    ensure => present,
    type   => string,
    data   => $::building,
  }

  registry_value { 'hklm\Software\NACSTech\Domain':
    ensure => present,
    type   => string,
    data   => $::domain,
  }

  registry_key { 'hklm\Software\NACSTech\Accessories':
    ensure => present,
  }

}
