# == Class: nacs_management::techspecs::mac
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
# include nacs_management::techspecs::mac
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::techspecs::mac {

  file { '/opt/NACSManage/facts.txt':
    ensure => file,
    owner   => 'technology',
    group   => 'staff',
    mode    => 0777,
  }

  exec { 'ComputerName':
    command => "/bin/echo 'ComputerName=${hostname}' >> /opt/NACSManage/facts.txt",    
  }

  #property_list_key { 'ComputerName':
  #  ensure     => present,
  #  path       => '/Library/Preferences/org.nacs.NACSTech.techspecs.plist',
  #  key        => 'ComputerName',
  #  value      => $::hostname,
  #  value_type => 'string',
  #}

  property_list_key { 'SerialNumber':
    ensure     => present,
    path       => '/Library/Preferences/org.nacs.NACSTech.techspecs.plist',
    key        => 'SerialNumber',
    value      => $::sp_serial_number,
    value_type => 'string',
  }

  property_list_key {'InventoryTag':
    ensure      => present,
    path        => '/Library/Preferences/org.nacs.NACSTech.techspecs.plist',
    key         => 'InventoryTag',
    value       => $::inventory_tag,
    value_type  => 'string',
  }

  property_list_key { 'RoomNumber':
    ensure      => present,
    path        => '/Library/Preferences/org.nacs.NACSTech.techspecs.plist',
    key         => 'RoomNumber',
    value       => $::room,
    value_type  => 'string',
  }

  property_list_key { 'Building':
    ensure      => present,
    path        => '/Library/Preferences/org.nacs.NACSTech.techspecs.plist',
    key         => 'Building',
    value       => $::building,
    value_type  => 'string',
  }

  property_list_key { 'DeviceType':
    ensure     => present,
    path       => '/Library/Preferences/org.nacs.NACSTech.techspecs.plist',
    key        => 'DeviceType',
    value      => $::mac_laptop,
    value_type => 'string',
  }

  property_list_key { 'SystemSpecs':
    ensure      => present,
    path        => '/Library/Preferences/org.nacs.NACSTech.techspecs.plist',
    key         => 'SystemSpecs',
    value       => [{
      'MACAddress'      => $::macaddress,
      'OperatingSystem' => "$::{macosx_productname} $::{macosx_productversion}",
      'Model'           => $::sp_machine_model,
      'Processor'       => "$::{sp_cpu_type} $::{sp_current_processor_speed}",
      'Memory'          => $::sp_physical_memory,}],
    value_type  => 'array',
  }
}