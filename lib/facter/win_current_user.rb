# This fact grabs the current logged in user
# on windows machines

Facter.add("win_current_user") do
  confine :kernel => "windows"
  setcode do
    Facter::Util::Resolution.exec('currentuser.bat')
  end
end
