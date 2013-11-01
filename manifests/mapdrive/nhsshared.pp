# == Class: nacs_management::mapdrive::nhsshared
#
# Map nhsshared drive for Mac OS X
#
# === Examples
#
# include nacs_management::mapdrive::nhsshared
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::mapdrive::nhsshared($user,$building = 'nhs', $serv = 'adm') {
	if ($operatingsystem == 'Darwin') {
		if $serv == 'adm' {
            $id = "A"
        }
        else {
            case $user {
                /^10[\d]+/:{ $id = "T" }
                default: { $id = "S" }
            }
        }

        if $building == 'nhs' {
            $drive = "J"
        } 
        else {
            $drive = "M"
        }

        $server = "nas-fs.nas.local"
        $folder = "nhs_shared"
	   	$script = "nhsshared.scpt"

	   	case $user {
            /[0-9]/: { $fulluser = "${id}${user}" }
            default: { $fulluser = "${user}" }
        }


        file { "/Users/${fulluser}/.nacs/${script}":
            ensure  => file,
            owner   => "${fulluser}",
            group   => "staff",
            mode    => 0755,
            content => template("nacs_management/mapdrive.erb"),
        }

	 	file { "/Users/${fulluser}/Library/LaunchAgents/org.nacs.nhsshared.plist":
            ensure  => file,
            owner   => "${fulluser}",
            group   => "staff",
            mode    => 0755,
            content => template("nacs_management/LaunchAgent.erb"),
        }
	}
}