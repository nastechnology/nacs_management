# == Class: nacs_management::mapdrive::nmsshared
#
# Map nmsshared drive for Mac OS X
#
# === Examples
#
# include nacs_management::mapdrive::nmsshared
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::mapdrive::nmsshared($user,$building = 'nms', $serv = 'adm') {
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

		if $building == 'nms' {
		    $drive = "J"
		}
		else {
		    $drive = "M"
		}

		case $user {
            /[0-9]/: { $fulluser = "${id}${user}" }
            default: { $fulluser = "${user}" }
        }

        $server = "nas-fs.nas.local"
        $folder = "nms_shared"
		$script = "nmsshared.scpt"

        file { "/Users/${fulluser}/.nacs/${script}":
            ensure  => file,
            owner   => "${fulluser}",
            group   => "staff",
            mode    => 0755,
            content => template("nacs_management/mapdrive.erb"),
        }
	
		file { "/Users/${fulluser}/Library/LaunchAgents/org.nacs.nmsshared.plist":
            ensure  => file,
            owner   => "${fulluser}",
            group   => "staff",
            mode    => 0755,
            content => template("nacs_management/LaunchAgent.erb"),
        }
	}
}