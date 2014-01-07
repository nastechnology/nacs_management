# This fact grabs the current logged in user
# on windows machines

Facter.add("win_current_user") do
  confine :kernel => "windows"
  setcode do
  	if File.file?('C:/NACSManage/whoami.exe')
      Facter::Util::Resolution.exec('cmd /c whoami.exe')
    end
  end
end
