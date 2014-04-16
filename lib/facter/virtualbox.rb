# This fact grabs test to see if virtualbox drive is installed

Facter.add("virtualbox") do
	confine :operatingsystem => "Darwin"
	setcode do
		result = Facter::Util::Resolution.exec("/opt/NACSManage/isinstalled.sh VirtualBox")
		if result == "installed"
			"installed"
		end
 	end
end