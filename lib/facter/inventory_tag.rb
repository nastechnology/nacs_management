# This fact grabs the "tag" out of the FusionInventory registry key
# or from agent.cfg file on Mac OS X 
# HIGHLY dependent on FusionInventory - hopefully move toward node.js app

Facter.add("inventory_tag") do
    setcode do
        case Facter.value(:operatingsystem)
        when "Darwin"
                 result = Facter::Util::Resolution.exec("/usr/bin/grep 'tag = ' /opt/fusioninventory$
                 thestring = result[6..result.length]
        when "windows"
               require 'win32/registry'
               Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\FusionInventory-Agent') do |reg|
                    thestring = reg['tag']
               end
        end

        thestring
    end
end

