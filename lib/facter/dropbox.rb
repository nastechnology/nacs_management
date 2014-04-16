# This fact grabs test to see if dropbox is installed

Facter.add("dropbox") do
	confine :operatingsystem => "Darwin"
	setcode do
		result = Facter::Util::Resolution.exec("/opt/NACSManage/isinstalled.sh Dropbox")
		if result == "installed"
			"installed"
		end
 	end
end