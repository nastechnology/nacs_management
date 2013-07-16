# == Class: nacs_management::install_printers::nhs_copier
#
# Install nhs_copier printer for Mac OS X machines
#
# === Examples
#
# include nacs_management::install_printers::nhs_copier
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::install_printers::nhs_copier {

	if ($operatingsystem == 'Darwin') {
		file{ '/private/etc/cups/ppd/nhs_copier.ppd':
	        ensure => file,
	        mode   => '0655',
	        owner  => 'root',
	        group  => '_lp',
	        source => 'puppet:///modules/nacs_mac_management/nhs_copier.ppd',
	        before => Printer['nhs_copier'],
	    }

	    printer { 'nhs_copier':
	        ensure      => 'present',
	        accept      => true,
	        description => 'NHS Koninca Minolta 601 Copier',
	        enabled     => 'true',
	        location    => 'NHS Office Workroom',
	        ppd         => '/private/etc/cups/ppd/nhs_copier.ppd',
	        uri         => 'lpd://10.20.15.220/',
	    	shared	=> false,
	    	options	=> { media => 'Letter' },
	    }
	}
}