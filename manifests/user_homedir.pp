# == Class: nacs_management::user_homedir
#
# Map home directory for users on Mac OS X
#
# === Examples
#
# include nacs_management::user_homedir('username')
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#

class nacs_management::user_homedir($user, $server = 'UNSET') {
	if ($operatingsystem == 'Darwin') {
		if $server == 'UNSET' {
		    case $user {
			/^10[\d]+/:{ $id = "T" }
			default: { $id = "S" } 
		    }
     	}
     	else {
            $id = "A"
     	}

		case $user {
            /[0-9]/: { $fulluser = "${id}${user}" }
            default: { $fulluser = "${user}" }
        }

		$drive = "home_dir"
		$script = "login.scpt"

		file {"/Users/${fulluser}/.nacs":
            ensure  => directory,
            owner   => "${fulluser}",
            group   => "staff",
            mode    => 0755,
        }

		if $user == 'markmyers' {
		    file { "/Users/${fulluser}/.nacs/${script}":
	                ensure  => file,
	                owner   => "${fulluser}",
	                group   => "staff",
	                mode    => 0755,
	                content => template("nacs_management/mark_homedir.erb"),
	            }
		}	
		else {
		
		    file { "/Users/${fulluser}/.nacs/${script}":
		    	ensure  => file,
		    	owner   => "${fulluser}",
	    	    	group   => "staff",
	    	    	mode    => 0755,
		    	content => template("nacs_management/user_homedir.erb"),
		    }
		}
		
		file { "/Users/${fulluser}/Library/LaunchAgents/org.nacs.User.login.plist":
            ensure  => file,
            owner   => "${fulluser}",
            group   => "staff",
            mode    => 0755,
            content => template("nacs_management/LaunchAgent.erb"),
        }
	}
}