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
  	  "nhs_copier": {
  	    printer { $printer:
          ensure      => present,
          uri         => "smb://nas-printserver/nhs_copier",
          description => "NHS Copier in Teacher Workroom",
          location    => "NHS Office",
          shared	  => false,
          ppd		  => "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTA601.gz",
  	    }
  	  }
  	}
}