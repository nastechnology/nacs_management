# == Class: nacs_management::install_printers
#
# Install printers for Mac OS X machines
#
# === Examples
#
# include nacs_management::install_printers
#
# === Authors
#
# Mark Myers <mark.myers@napoleonareaschools.org>
#
# === Copyright
#
# Copyright 2013 Mark Myers, unless otherwise noted.
#
class nacs_management::install_printers {
	$mode = '0655'
	$owner = 'root'
	$group = '_lp'
}