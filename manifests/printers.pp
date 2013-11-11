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
  
  case $printer {

	  # Highly dependent on http://onyxftp.mykonicaminolta.com/DownloadFile/Download.ashx?fileid=33830&productid=1138
	  'nhs_copier': {
	    printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.220/",
        description => "NHS Copier in Teacher Workroom",
        location    => "NHS Office",
        shared	    => false,
        ppd		      => "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz",
	    }
	  }

    'nhs_color': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.237/",
        description => "NHS Color Printer",
        location    => "Secretary Office",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5300DN.PPD",
      }
    }

    'cbi_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.11.7/",
        description => "CBI Copier",
        location    => "Joe Goods classroom",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_2035-pxlmono-Ricoh.ppd.gz",
      }
    }

    'nhs_deca': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.235/",
        description => "DECA Printer",
        location    => "DECA",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-2020D.PPD",
      }
    }

    'nhs_art': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.228/",
        description => "Art Printer",
        location    => "Art",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5350DN.PPD",
      }
    }

    'nhs_140_c': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.248/",
        description => "FSCI Color printer",
        location    => "NHS 140",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5100DN.PPD",
      }
    }

    'nhs_131_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.226/",
        description => "Guidance Ciopier",
        location    => "NHS Guidance",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_5001-pxlmono-Ricoh.ppd.gz",
      }
    }

    'nhs_wkrm_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.233",
        description => "Ricoh 7500 Copier",
        location    => "NHS 231",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_7500-pxlmono-Ricoh.ppd.gz",
      }
    }

    'nhs_wkrm_copier_2': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.232",
        description => "Ricoh 7500 Copier 2",
        location    => "NHS 231",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_7500-pxlmono-Ricoh.ppd.gz",
      }
    }

    'nhs_wkrm_231': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.234/",
        description => "NHS Workroom 231",
        location    => "NHS 231",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD",
      }
    }

    'nhs_207': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.247",
        description => "NHS Workroom 207",
        location    => "NHS 207",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD",
      }
    }

    'hs_stafflounge': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.254",
        description => "NHS Staff Lounge",
        location    => "NHS Staff Lounge",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD",
      }
    }

    'nhs_library': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.244",
        description => "NHS Library",
        location    => "NHS Library",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD",
      }
    }

    'nhs_218': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.11.229",
        description => "Lori Drewes",
        location    => "NHS 218",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/en.lproj/HP-LaserJet_5-pxlmono.ppd.gz",
      }
    }

    'nhs_library_aide': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.11.230/",
        description => "Library Aide printer",
        location    => "NHS Library",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/en.lproj/HP-LaserJet_4000-pxlmono.ppd.gz",
      }
    }

    # CES Printers
    'ces_office_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.35.10/",
        description => "Central Office Copier",
        location    => "CES Office",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz",
      }
    }

    'ces_wkrm': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.35.11/",
        description => "Central Workroom Copier",
        location    => "CES Workroom",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz",
      }
    }

    'ces_upstairs_wkrm': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.35.12/",
        description => "Central Upstairs Workroom Copier",
        location    => "CES Workroom Upstairs",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz",
      }
    }

    # CDB Pritners
    'ces_kg_colorlaser': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.33.11/",
        description => "CES Kindergarten Colorlaser",
        location    => "CES Kindergarten",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz",
      }
    }

    'cdb_wkrm_colorlaser': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.55.12/",
        description => "C.D. Brillhart Workroom Colorlaser",
        location    => "CDB Workroom",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/Kyocera\ FS-C5100DN.PPD",
      }
    }

    'cdb_wkrm_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.55.11/",
        description => "C.D. Brillhart Workroom Copier",
        location    => "CDB Workroom",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_6500-pxlmono-Ricoh.ppd.gz",
      }
    }

    'cdb_wkrm': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.55.15",
        description => "C.D. Brillhart Workroom printer",
        location    => "CDB Workroom",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/en.lproj/Kyocera\ FS-1030D.PPD",
      }
    }

    'cdb_mod': {
      printer { $printer:
        ensure      => present,
        uri         => 'lpd://10.20.55.10',
        description => "C.D. Brillhart modular printer",
        localtion   => "CDB Modular",
        shared      => false,
        ppd         => "/Library/Pritners/PPDs/Contents/Resources/en.lproj/Kyocera\ FS-3900DN.PPD",
      }
    }

    'cdb_108_copier': {
      printer { $printer:
        ensure      => present,
        uri         => 'lpd://10.20.55.13',
        description => "C.D. Brillhart 108 Copier",
        location    => "CDB 108",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resourced/en.lproj/Ricoh-Aficio_MP_7500-pxlmono-Ricoh.ppd.gz",
      }
    }

    'cdb_108': {
      printer { $printer:
        ensure      => present,
        uri         => 'lpd://10.20.55.14',
        description => "C.D. Brillhart 108 Printer",
        location    => "CDB 108",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resourced/Kyocera\ FS-3920DN.PPD",
      }
    }

    # NMS Printers
    'nms_office_copier': {
      printer { $printer:
        ensure      => present,
        uri         => 'lpd://10.20.25.120',
        description => "NMS Office Copier",
        location    => "NMS Office",
        shared      => false,
        ppd         => "Library/Printers/PPDs/Contents/Resourced/en.lproj/Ricoh-Aficio_MP_7500-pxlmono-Ricoh.ppd.gz"
      }
    }

    # WES Printers
    'wes_wkrm_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.45.124/",
        description => "West Workroom Copier",
        location    => "WES Workroom",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_6500-pxlmono-Ricoh.ppd.gz",
      }
    }
  }
}