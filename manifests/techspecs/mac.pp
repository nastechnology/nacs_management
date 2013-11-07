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

  file { '/etc/facter/facts.d/facts.txt':
    ensure => file,
    owner  => 'technology',
    group  => 'staff',
    mode   => 0777,
  }

  if ($computername != ''){
    exec { 'ComputerName':
      command => "/bin/echo 'ComputerName=${hostname}' >> /etc/facter/facts.d/facts.txt",    
    }
  }

  exec { 'SerialNumber':
    command => "/bin/echo 'SerialNumber=${sp_serial_number}' >> /opt/NACSManage/facts.txt",
  }

  exec { 'InventoryTag':
    command => "/bin/echo 'InventoryTag=${inventory_tag}' >> /opt/NACSManage/facts.txt",
  }

  exec { 'RoomNumber':
    command => "/bin/echo 'RoomNumber=${room}' >> /opt/NACSManage/facts.txt",
  }

  exec { 'Building':
    command => "/bin/echo 'Building=${Building}' >> /opt/NACSManage/facts.txt",
  }

  exec { 'DeviceType':
    command => "/bin/echo 'DeviceType=${mac_laptop}' >> /opt/NACSManage/facts.txt",  
  }

  file { '/opt/NACSManage/SystemSpecs.txt':
    ensure => file,
    owner  => 'technology',
    group  => 'staff',
    mode   => 0777,
  }

  exec { 'MACAddress':
    command => "/bin/echo 'MACAddress=${macaddress}' >> /opt/NACSManage/SystemSpecs.txt",
  }

  exec { 'OperatingSystem':
    command => "/bin/echo 'OperatingSystem=${macosx_productname} ${macosx_productversion}' >> /opt/NACSManage/SystemSpecs.txt",
  }

  exec { 'Model':
    command => "/bin/echo 'Model=${sp_machine_model}' >> /opt/NACSManage/SystemSpecs.txt",
  }
  
  exec { 'Processor':
    command => "/bin/echo 'Processor=${sp_cpu_type} ${sp_current_processor_speed}' >> /opt/NACSManage/SystemSpecs.txt",
  }

  exec { 'Memory':
    command => "/bin/echo 'Memory=${sp_physical_memory}' >> /opt/NACSManage/SystemSpecs.txt",
  }
}
