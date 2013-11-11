# == Defintion: nacs_management::printers
#
# A type that takes a printer name
#
# == Parameters
#  - The $name of the printer to install
#
# == Actions
#  - Adds printer to the computer
#
# === Examples
#
# nacs_management::printers{ 'nhs_copier': }
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
define nacs_management::printers ($printer = $name) {   
  package { 'Kyocera_OS_X_10.5_Web_build_2012.11.30.dmg':
    provider => pkgdmg,
    source   => 'http://tech.napoleonareaschools.org/Kyocera_OS_X_10.5_Web_build_2012.11.30.dmg',
    ensure   => installed,
  } 

  package { 'foomatic-rip-4.0.6.230.dmg':
    provider => pkgdmg,
    source   => 'http://tech.napoleonareaschools.org/foomatic-rip-4.0.6.230.dmg',
    ensure   => installed,
  }

  package { 'gplgs-8.71.dmg':
    provider => pkgdmg,
    source   => 'http://tech.napoleonareaschools.org/gplgs-8.71.dmg',
    ensure   => installed,
    require  => Package['foomatic-rip-4.0.6.230.dmg']
  }

  package { 'pxlmono-1.9.dmg':
    provider => pkgdmg,
    source   => 'http://tech.napoleonareaschools.org/pxlmono-1.9.dmg',
    ensure   => installed,
    require  => Package['gplgs-8.71.dmg']
  }
  
  case $printer {

	  # Highly dependent on http://onyxftp.mykonicaminolta.com/DownloadFile/Download.ashx?fileid=33830&productid=1138
	  'nhs_copier': {
	    printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.220/",
        description => "NHS Copier in Teacher Workroom",
        location    => "NHS Office",
        shared	  => false,
        ppd		  => "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz",
	    }
	  }

    'nhs_color': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.237/",
        description => "NHS Color Printer",
        location    => "Secretary Office",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5300DN.PPD",
      }
    }

    'cbi_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/cbi_copier",
        description => "CBI Copier",
        location    => "Joe Goods classroom",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_2035-pxlmono-Ricoh.ppd.gz",
      }
    }

    'nhs_deca': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/nhs_deca",
        description => "DECA Printer",
        location    => "DECA",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-2020D.PPD",
      }
    }

    'nhs_art': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.228/",
        description => "Art Printer",
        location    => "Art",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5350DN.PPD",
      }
    }

    'nhs_140_c': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/nhs_140_c",
        description => "FSCI Color printer",
        location    => "NHS 140",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5100DN.PPD",
      }
    }

    'nhs_131_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/nhs_131_copier",
        description => "Guidance Ciopier",
        location    => "NHS Guidance",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_5001-pxlmono-Ricoh.ppd.gz",
      }
    }

    'nhs_wkrm_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/nhs_wkrm_copier",
        description => "Ricoh 7500 Copier",
        location    => "NHS 231",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_7500-pxlmono-Ricoh.ppd.gz",
      }
    }

    'nhs_wkrm_copier_2': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/nhs_wkrm_copier_2",
        description => "Ricoh 7500 Copier 2",
        location    => "NHS 231",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_7500-pxlmono-Ricoh.ppd.gz",
      }
    }

    'nhs_wkrm_231': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/nhs_wkrm_231",
        description => "NHS Workroom 231",
        location    => "NHS 231",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD",
      }
    }

    'nhs_207': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/nhs_207",
        description => "NHS Workroom 207",
        location    => "NHS 207",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD",
      }
    }

    'hs_stafflounge': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/hs_stafflounge",
        description => "NHS Staff Lounge",
        location    => "NHS Staff Lounge",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD",
      }
    }

    'nhs_library': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/nhs_library",
        description => "NHS Library",
        location    => "NHS Library",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD",
      }
    }

    'nhs_218': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/nhs_218",
        description => "Lori Drewes",
        location    => "NHS 218",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/en.lproj/HP-LaserJet_5-pxlmono.ppd.gz",
      }
    }

    'nhs_library_aide': {
      printer { $printer:
        ensure      => present,
        uri         => "smb://nas-printserver/nhs_library_aide",
        description => "Library Aide printer",
        location    => "NHS Library",
        shared    => false,
        ppd     => "/Library/Printers/PPDs/Contents/Resources/en.lproj/HP-LaserJet_4000-pxlmono.ppd.gz",
      }
    }
  }
}