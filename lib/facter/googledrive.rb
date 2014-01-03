# This fact grabs test to see if google drive is installed

Facter.add("googledrive") do
	confine :operatingsystem => "Darwin"
	setcode do
		result = Facter::Util::Resolution.exec("/opt/NACSManage/isinstalled.sh Google\ Drive")
		if result == "installed"
			"installed"
		end
 	end
end