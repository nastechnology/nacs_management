class nacs_management::cm-trl {

    package { 'CM_TRL':
	ensure => installed,
    }


    exec { 'SetCM_TRLPerms':
	command => 'C:\SetACL.exe -on "C:\CM_TRL" -ot file -actn ace -ace "n:Everyone;p:full"',
	require => Package['CM_TRL'],
    }    

    file { "C:\Documents and Settings\All Users\Desktop\Consumer Mathematics Teacher Resource Library.lnk":
	ensure => file,
	source => 'puppet:///modules/nacs_management/Consumer Mathematics Teacher Resource Library.lnk',
    }
}
