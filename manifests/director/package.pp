class bacula::director::package {

	package  { $bacula::director::package_name:
		ensure => present
	}
}
