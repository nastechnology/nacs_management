class nacs_management::autologin($user,$password){


    if $operatingsystem == 'windows' {
    	registry_value {'hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogin\DefaultUserName':
    	    ensure => present,
    	    type   => string,
    	    data   => "${user}",
    	}

    	registry_value {'hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogin\DefaultPassword':
    	    ensure => present,
    	    type   => string,
    	    data   => "${password}",
    	}

    	registry_value {'hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogin\AutoAdminLogon':
    	    ensure => present,
    	    type   => string,
    	    data   => '1',
    	}

    }
    else {
	notify {"This can only be used with windows operating system":}
    }

}
