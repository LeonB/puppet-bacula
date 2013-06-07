define bacula::director::client (
  $password,
  $fileset  = 'Server'
) {

  if ! is_domain_name($name) {
    fail "Name for client ${name} must be a fully qualified domain name"
  }

  file { "/etc/bacula/bacula-dir.d/${name}.conf":
    ensure  => file,
    content => template('bacula/client_config.erb'),
    notify  => Class['bacula::director::service'],
  }
}
