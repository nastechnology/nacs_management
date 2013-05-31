class nacs_management::checkin {

	if ($operatingsystem == 'Darwin') or ($operatingsystem == 'Ubuntu') {

            file { "/opt/NACSManage/checkin.sh":
            	ensure  => file,
            	owner   => "technology",
            	group   => "staff",
            	mode    => 0755,
            	content => template("nacs_management/nonwindows_checkin.erb"),
            	require => File['/opt/NACSManage'],
            }

            exec { "Checkin":
            	command => "/bin/bash /opt/NACSManage/checkin.sh",
            	require => File['/opt/NACSManage/checkin.sh'],
            }
	
	}
	else {
	    # Assumes Windows
	    file { "C:/NACSManage/checkin.bat":
		ensure	=> file,
		owner	=> 'Administrator',
		group	=> 'Administrators',
		mode	=> 0755,
		content	=> template('nacs_management/windows_checkin.erb'),
		require => File['C:/NACSManage'],
	    }
	
	    exec { "Checkin":
		command => "cmd.exe /c C:/NACSManage/checkin.bat",
		require => File['C:/NACSManage/checkin.bat'],
	    }	
  	}

}
