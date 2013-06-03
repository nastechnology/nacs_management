class nacs_management::checkin {

    case $operatingsystem {
	'Darwin', 'Ubuntu': {
	    $checkinfile = '/opt/NACSManage/checkin.sh'
	    $command = '/bin/bash /opt/NACSManage/checkin.sh'
	    $owner = 'technology'
	    $group = 'staff'
	    $template = 'nonwindows_checkin.erb'
	}
	default: {
	    $checkinfile = "C:/NACSManage/checkin.bat"
	    $command = "cmd.exe /c C:/NACSManage/checkin.bat"
	    $owner = 'Administrator'
	    $group = 'Administrators'
	    $template = 'windows_checkin.erb'
	}
    }


    file { $checkinfile:
       	ensure  => file,
       	owner   => $owner,
       	group   => $group,
       	mode    => 0755,
       	content => template("nacs_management/nonwindows_checkin.erb"),
    }

    exec { "Checkin":
       	command => $command,
       	require => File[$checkinfile],
    }	
}
