class bacula::director(
	$package_name     = params_lookup( 'package_name' ),
	$console_password = params_lookup( 'console_password' ),
	$storage_password = params_lookup( 'storage_password' ),
	$mail_to          = params_lookup( 'mail_from' ),
	$mail_from        = params_lookup( 'mail_to' ),
	$db_name          = params_lookup( 'db_name' ),
	$db_address       = params_lookup( 'db_address' ),
	$db_user          = params_lookup( 'db_user' ),
	$db_password      = params_lookup( 'db_password' ),
) inherits bacula::director::params {

	include bacula::director::package, bacula::director::config, bacula::director::service
}
