class nacs_management::sirsi {
    $pkg = 'SirsiWorkflows'

    package { $pkg:
	ensure  => 'installed',
    }

    exec { "ChangeSirsiPerms":
	command => 'C:\SetACL.exe -on "C:\Program Files\Sirsi" -ot file -actn ace -ace "n:Everyone;p:full"',
	require => Package['SirsiWorkflows'],
    }

    file { "C:\WINDOWS\\Fonts\free3of9 barcode font.ttf":
	ensure 	=> file,
	owner	=> 'SYSTEM',
	group	=> 'Users',
	mode	=> '0777',
	source	=> 'puppet:///modules/nacs_management/free3of9 barcode font.ttf',
	require => Exec['ChangeSirsiPerms'],
    }
}
