# Class: bacula::director::params
#
# This class defines default parameters used by the main module class bacula
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to bacula class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class bacula::director::params {

	### Application related parameters

	$package_name = $::operatingsystem ? {
		default => 'bacula-director-mysql'
	}

	$mail_from   = 'root@localhost'
	$mail_to     = 'root@localhost'
	$db_name     = 'bacula'
	$db_address  = 'localhost'
	$db_user     = 'root'
	$db_password = undef

}
