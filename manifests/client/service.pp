class bacula::client::service {

	service { 'bacula-fd':
		ensure     => running,
		hasstatus  => true,
		hasrestart => true,
		enable     => true,
		require    => Class['bacula::client::package'],
		subscribe  => Class['Bacula::Client::Config']
	}
}
