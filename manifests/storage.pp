class bacula::storage(
	$package_name = params_lookup( 'package_name' ),
	$password     = params_lookup( 'password' ),
) inherits bacula::storage::params {

	include bacula::storage::package, bacula::storage::config, bacula::storage::service
}
