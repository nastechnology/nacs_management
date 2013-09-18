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

  registry_key {'hkcc\NACSTech':
    ensure => present,
  }

  registry_value {'hkcc\NACSTech\RoomNumber':
    ensure => present,
    type   => string,
    data   => $::room,
  }

  registry_key { 'hkcc\NACSTech\RoomInv':
    ensure => present,
  }

  registry_value { 'hkcc\NACSTech\SerialNumber':
    ensure => present,
    type   => string,
    data   => $::serialnumber,
  }

  registry_key { 'hkcc\NACSTech\SystemSpecs':
    ensure => present,
  }

  registry_key { 'hkcc\NACSTech\Accessories\Monitors':
    ensure => present,
  }

  registry_key { 'hkcc\NACSTech\Accessories\Projectors':
    ensure => present,
  }

  registry_key { 'hkcc\NACSTech\Accessories\SMART':
    ensure => present,
  }

  registry_value { 'hkcc\NACSTech\SystemSpecs\MACAddress':
    ensure => present,
    type   => string,
    data   => $::macaddress,
  }

  registry_value { 'hkcc\NACSTech\SystemSpecs\OperatingSystem':
    ensure => present,
    type   => string,
    data   => $::operatingsystem,
  }

  registry_value { 'hkcc\NACSTech\SystemSpecs\Model':
    ensure => present,
    type   => string,
    data   => $::productname,
  }

  registry_value { 'hkcc\NACSTech\SystemSpecs\Processor':
    ensure => present,
    type   => string,
    data   => $::processor0,
  }

  registry_value { 'hkcc\NACSTech\SystemSpecs\Memory':
    ensure => present,
    type   => string,
    data   => $::memorytotal,
  }

  registry_value { 'hkcc\NACSTech\ComputerName':
    ensure => present,
    type   => string,
    data   => $::hostname,
  }

  registry_value {'hkcc\NACSTech\InventoryTag':
    ensure => present,
    type   => string,
    data   => $::inventory_tag,
  }

  registry_value { 'hkcc\NACSTech\Building':
    ensure => present,
    type   => string,
    data   => $::building,
  }

  registry_value { 'hkcc\NACSTech\Domain':
    ensure => present,
    type   => string,
    data   => $::domain,
  }

  registry_key { 'hkcc\NACSTech\Accessories':
    ensure => present,
  }

}
