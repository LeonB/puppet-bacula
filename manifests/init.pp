class bacula(
	$user             = params_lookup( 'user' ),
) inherits bacula::params {

	include bacula::config
}
