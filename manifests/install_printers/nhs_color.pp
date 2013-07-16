# == Class: nacs_management::install_printers::nhs_color
#
# Install nhs_color printer for Mac OS X machines
#
# === Examples
#
# include nacs_management::install_printers::nhs_color
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::install_printers::nhs_color {
	
	if ($operatingsystem == 'Darwin') {
		file {'/private/etc/cups/ppd/nhs_color.ppd':
		    ensure => file,
		    mode   => '0655',
		    owner  => 'root',
		    group  => '_lp',
		    source => 'puppet:///modules/nacs_management/nhs_color.ppd',
		    before => Printer['nhs_color'],
		}

		printer { 'nhs_color':
		    ensure   	=> 'present',
		    accept	=> true,
		    description => 'NHS Kyocera FS-5300DN Color printer',
		    enabled	=> 'true',
		    location	=> 'NHS Secretary Office',
		    ppd		=> '/private/etc/cups/ppd/nhs_color.ppd',
		    uri		=> 'lpd://10.20.15.237/',
		    shared	=> false,
		    options	=> { media => 'Letter'},
		}
	}

}