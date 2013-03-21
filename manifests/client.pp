class bacula::client(
	$package_name = params_lookup( 'package_name' ),
	$password = params_lookup( 'password' )
) inherits bacula::client::params {

	include bacula::client::package, bacula::client::config, bacula::client::service
}
