class bacula::storage(
  $package_name     = params_lookup( 'package_name' ),
  $password         = params_lookup( 'password' ),
  $monitor_password = params_lookup( 'monitor_password' ),
  $director_server  = params_lookup( 'director_server' ),
) inherits bacula::storage::params {

  include bacula::storage::package, bacula::storage::config, bacula::storage::service
}
