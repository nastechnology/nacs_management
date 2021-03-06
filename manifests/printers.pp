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
      ensure       => present,
      uri          => "lpd://10.20.15.220",
      description  => 'NHS Copier in Teacher Workroom in Office',
      location     => 'NHS Office',
      shared       => false,
      ppd          => '/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz',
      ppd_options => { 'Finisher' => 'FS504' },
    }
  }

    'boe_copier': {
      printer { $printer:
        ensure      => present,
        uri         => 'lpd://10.20.15.221/',
        description => 'BOE Color Copier',
        location    => 'Board Office',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC554.gz',
      }
    }

    'nhs_color': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.237",
        description => 'NHS Color Printer',
        location    => 'Secretary Office',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5300DN.PPD',
      }
    }

    'cbi_copier': {
      printer { $printer:
        ensure      => present,
        uri         => 'lpd://10.20.11.7/',
        description => 'CBI Copier',
        location    => 'Joe Goods classroom',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_2035-pxlmono-Ricoh.ppd.gz',
      }
    }

    'nhs_deca': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.13.254",
        description => 'DECA Printer',
        location    => 'DECA',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-2020D.PPD',
      }
    }

    'nhs_art': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.228",
        description => 'Art Printer',
        location    => 'Art',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5350DN.PPD',
      }
    }

    'nhs_140_c': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.248",
        description => 'FSCI Color printer',
        location    => 'NHS 140',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5100DN.PPD',
      }
    }

    'nhs_131_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.226",
        description => 'Guidance Copier',
        location    => 'NHS Guidance',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_5001-pxlmono-Ricoh.ppd.gz',
      }
    }

    'nhs_wkrm_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.232",
        description => 'NHS 2nd Floor North Wkrm',
        location    => 'NHS 2nd Floor North Wkrm',
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_7500-pxlmono-Ricoh.ppd.gz',
      }
    }

    'nhs_wkrm_copier_2': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.233",
        description => 'NHS 2nd Floor South Wkrm',
        location    => 'NHS 2nd Floor South Wkrm',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_7500-pxlmono-Ricoh.ppd.gz',
      }
    }

    'nhs_wkrm_231': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.234",
        description => 'NHS Workroom 231',
        location    => 'NHS 231',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD',
      }
    }

    'nhs_207': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.247",
        description => 'NHS Swing Space',
        location    => 'NHS Swing Space',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD',
      }
    }

    'hs_stafflounge': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.254",
        description => 'NHS Staff Lounge',
        location    => 'NHS Staff Lounge',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD',
      }
    }

    'nhs_library': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.15.244",
        description => 'NHS Library',
        location    => 'NHS Library',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD',
      }
    }

    #'nhs_218': {
    #  printer { $printer:
    #    ensure      => present,
    #    uri         => "lpd://10.20.15.23/${printer}",
    #    description => 'Lori Drewes',
    #    location    => 'NHS 218',
    #    shared      => false,
    #    ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/HP-LaserJet_5-pxlmono.ppd.gz',
    #  }
    #}

    #'nhs_library_aide': {
    #  printer { $printer:
    #    ensure      => present,
    #    uri         => "lpd://10.20.15.23/${printer}",
    #    description => 'Library Aide printer',
    #    location    => 'NHS Library',
    #    shared      => false,
    #    ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/HP-LaserJet_4000-pxlmono.ppd.gz',
    #  }
    #}

    # CES Printers
    'ces_office_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.35.10",
        description => 'Central Office Copier',
        location    => 'CES Office',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz',
      }
    }

    'ces_wkrm': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.35.11",
        description => 'Central Workroom Copier',
        location    => 'CES Workroom',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz',
      }
    }

    'ces_upstairs_wkrm': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.35.12",
        description => 'Central Upstairs Workroom Copier',
        location    => 'CES Workroom Upstairs',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz',
      }
    }

    # CDB Pritners
    'ces_kg_colorlaser': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.33.11",
        description => 'CES Kindergarten Colorlaser',
        location    => 'CES Kindergarten',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5350DN.PPD',
      }
    }

    'cdb_wkrm_colorlaser': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.55.12",
        description => 'C.D. Brillhart Workroom Colorlaser',
        location    => 'CDB Workroom',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5100DN.PPD',
      }
    }

    'cdb_wkrm_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.55.11",
        description => 'C.D. Brillhart Workroom Copier',
        location    => 'CDB Workroom',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_6500-pxlmono-Ricoh.ppd.gz',
      }
    }

    'cdb_wkrm': {
      printer { $printer:
        ensure      => present,
        uri         => 'lpd://10.20.55.15',
        description => 'C.D. Brillhart Workroom printer',
        location    => 'CDB Workroom',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/Kyocera FS-1030D.PPD',
      }
    }

    'cdb_mod': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.53.10",
        description => 'C.D. Brillhart modular printer',
        location    => 'CDB Modular',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD',
      }
    }

    'cdb_108_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.55.13",
        description => 'C.D. Brillhart 108 Copier',
        location    => 'CDB 108',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_7500-pxlmono-Ricoh.ppd.gz',
      }
    }

    'cdb_108': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.55.14",
        description => 'C.D. Brillhart 108 Printer',
        location    => 'CDB 108',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD',
      }
    }

    # NMS Printers
    'nms_office_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.25.120",
        description => 'NMS Office Copier',
        location    => 'NMS Office',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_7500-pxlmono-Ricoh.ppd.gz',
      }
    }

    'nms_ces_ricoh_7500': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.33.10",
        description => 'CES/NMS Basement Copier',
        location    => 'CES/NMS Basement work room',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_7500-pxlmono-Ricoh.ppd.gz',
      }
    }

    'nms_8lab': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.23.246",
        description => 'NMS 8 Lab HP 4050 Printer',
        location    => 'NMS 8 Lab',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/HP-LaserJet_4050-pxlmono.ppd.gz',
      }
    }

    'nms_band': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.23.245",
        description => 'NMS Band HP LaserJet 6P',
        location    => 'NMS Band',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/HP-LaserJet_5-pxlmono.ppd.gz',
      }
    }

    'nms_colorlaser': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.25.121",
        description => 'NMS Kyocera C5030DN Colorlaser',
        location    => 'NMS Office',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5350DN.PPD',
      }
    }

    'nms_library': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.35.15",
        description => 'NMS Library HP LaserJet 2100',
        location    => 'NMS Library',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/HP-LaserJet_2100-pxlmono.ppd.gz',
      }
    }

    'nms_office': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.25.122",
        description => 'NMS Office Printer HP LaserJet',
        location    => 'NMS Office',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/HP-LaserJet_2300-pxlmono.ppd.gz',
      }
    }

    'nms_upstairs_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.25.124",
        description => 'NMS Upstairs Bizhub 601',
        location    => 'NMS Upstairs Workroom',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz',
      }
    }

    # WES Printers
    'wes_wkrm_copier': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.45.124",
        description => 'West Workroom Copier',
        location    => 'WES Workroom',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/en.lproj/Ricoh-Aficio_MP_6500-pxlmono-Ricoh.ppd.gz',
      }
    }

    #'wes_112': {
    #  printer { $printer:
    #    ensure      => present,
    #    uri         => "lpd://10.20.45.121",
    #    description => 'West Kyocera 3920DN',
    #    location    => 'WES 112',
    #    shared      => false,
    #    ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD',
    #  }
    #}

    'wes_library': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.43.10",
        description => 'West Library Kyocera 3920DN',
        location    => 'WES Library',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-3920DN.PPD',
      }
    }

    'wes_office': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.45.122",
        description => 'West Office Bizhub 601 copoier',
        location    => 'WES Office',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz',
      }
    }

    'wes_wkrm_color': {
      printer { $printer:
        ensure      => present,
        uri         => "lpd://10.20.45.123",
        description => 'West Workroom Colorlaser 5350',
        location    => 'WES Workroom',
        shared      => false,
        ppd         => '/Library/Printers/PPDs/Contents/Resources/Kyocera FS-C5350DN.PPD',
      }
    }
  }
}
