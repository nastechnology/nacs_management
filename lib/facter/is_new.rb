# This fact grabs test to see if google drive is installed

Facter.add("is_new") do
  confine :operatingsystem => "Darwin"
  setcode do
    if File.exists?("/opt/NACSManage/new.txt")
      return true
    else
      return false
    end
   end
end
