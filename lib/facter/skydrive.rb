# This fact grabs test to see if skydrive drive is installed

Facter.add("skydrive") do
	confine :operatingsystem => "Darwin"
	setcode do
		result = Facter::Util::Resolution.exec("/opt/NACSManage/isinstalled.sh SkyDrive")
		if result == "installed"
			"installed"
		end
 	end
end