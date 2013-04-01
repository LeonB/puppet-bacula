class bacula::director(
	$package_name     = params_lookup( 'package_name' ),
	$enabled          = params_lookup( 'enabled' ),

	$password         = params_lookup( 'password' ),
	$storage_password = params_lookup( 'storage_password' ),
	$monitor_password = params_lookup( 'monitor_password' ),
	$mail_to          = params_lookup( 'mail_from' ),
	$mail_from        = params_lookup( 'mail_to' ),
	$db_name          = params_lookup( 'db_name' ),
	$db_address       = params_lookup( 'db_address' ),
	$db_user          = params_lookup( 'db_user' ),
	$db_password      = params_lookup( 'db_password' ),
	$storage_server   = params_lookup( 'storage_server' ),
) inherits bacula::director::params {

  	$ensure = $enabled ? {
  		true => present,
  		false => absent
  	}

	include bacula::director::package, bacula::director::config, bacula::director::service
}
