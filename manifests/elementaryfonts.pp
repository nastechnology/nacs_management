class nacs_management::elementaryfonts {

  if($operatingsystem == 'windows'){
    package { 'elementaryfonts':
        ensure => installed,
    }

    file { "C:\NACSManage\fonts.reg":
        replace => 'no',
        ensure  => 'file',
        owner   => 'SYSTEM',
        group   => 'Administrators',
        mode    => '0777',
        source  => 'puppet:///modules/nacs_management/fonts.reg',
    }

    exec { 'ChangeFontREGPerms':
        command => 'C:\SetACL.exe -on "C:\NACSManage\fonts.reg" -ot file -actn ace -ace "n:Everyone;p:full"',
        require => File['C:\NACSManage\fonts.reg'],
    }

    exec { 'SetFontDirPerms':
        command => 'C:\SetACL.exe -on "C:\WINDOWS\Fonts" -ot file -actn ace -ace "n:Everyone;p:full"',
        require => Package['elementaryfonts'],
    }

    exec { 'CopyElementaryFonts':
        command => 'cmd.exe /c xcopy "C:\NACSManage\elementaryfonts\*.ttf" "C:\WINDOWS\Fonts" /y',
        require => Exec['SetFontDirPerms'],
    }
  }  
}
