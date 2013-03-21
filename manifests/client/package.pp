class bacula::client::package {

	package  { $bacula::client::package_name:
		ensure => present
	}
}
