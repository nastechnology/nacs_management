# This fact grabs test to see if gatekeeper is enabled

Facter.add("gatekeeper") do
  confine :operatingsystem => "Darwin"
  setcode do
    result = Facter::Util::Resolution.exec("/usr/sbin/spctl --status | if [ `grep -c disabled` == 1 ]; then echo disabled; fi")
    if result == "disabled"
      "0"
    else
      "1"
    end
   end
end
