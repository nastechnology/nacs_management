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

  exec { 'ComputerName':
    command => "/bin/echo 'ComputerName=${hostname}' >> /opt/NACSManage/facts.txt",
    unless  => "/usr/bin/grep -qFx 'ComputerName=${hostname}' '/opt/NACSManage/facts.txt'",
  }

  file { '/opt/NACSManage/setfileicon':
    ensure => file,
    owner  => 'root',
    group  => 'wheel',
    mode   => 0777,
    source => "puppet:///modules/nacs_management/setfileicon",
  }

  exec { 'DeviceType':
    command => "/bin/echo 'DeviceType=${mac_laptop}' >> /opt/NACSManage/facts.txt",
    unless  => "/usr/bin/grep -qFx 'DeviceType=${mac_laptop}' '/opt/NACSManage/facts.txt'",
  }

  file { '/opt/NACSManage/SystemSpecs.txt':
    ensure => file,
    owner  => 'root',
    group  => 'wheel',
    mode   => 0777,
  }

  exec { 'MACAddress':
    command => "/bin/echo 'MACAddress=${macaddress}' >> /opt/NACSManage/SystemSpecs.txt",
    unless  => "/usr/bin/grep -qFx 'MACAddress=${macaddress}' '/opt/NACSManage/SystemSpecs.txt'",
  }

  exec { 'OperatingSystem':
    command => "/bin/echo 'OperatingSystem=${macosx_productname} ${macosx_productversion}' >> /opt/NACSManage/SystemSpecs.txt",
    unless  => "/usr/bin/grep -qFx 'OperatingSystem=${macosx_productname} ${macosx_productversion}' '/opt/NACSManage/SystemSpecs.txt'",
  }

  exec { 'Model':
    command => "/bin/echo 'Model=${sp_machine_model}' >> /opt/NACSManage/SystemSpecs.txt",
    unless  => "/usr/bin/grep -qFx 'Model=${sp_machine_model}' '/opt/NACSManage/SystemSpecs.txt'",
  }
  
  exec { 'Processor':
    command => "/bin/echo 'Processor=${sp_cpu_type} ${sp_current_processor_speed}' >> /opt/NACSManage/SystemSpecs.txt",
    unless  => "/usr/bin/grep -qFx 'Processor=${sp_cpu_type} ${sp_current_processor_speed}' '/opt/NACSManage/SystemSpecs.txt'",
  }

  exec { 'Memory':
    command => "/bin/echo 'Memory=${sp_physical_memory}' >> /opt/NACSManage/SystemSpecs.txt",
    unless  => "/usr/bin/grep -qFx 'Memory=${sp_physical_memory}' '/opt/NACSManage/SystemSpecs.txt'",
  }
}
