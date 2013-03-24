class bacula::director::config inherits bacula::config {

	file { '/etc/bacula/bacula-dir.conf':
        ensure  => $bacula::director::ensure,
        content => template("bacula/bacula-dir.conf.erb"),
        require => Class['bacula::director::package'],
        notify  => Class['bacula::director::service']
	}

	file { '/etc/bacula/bacula-dir.d/':
		ensure  => $bacula::director::ensure ? { present => directory, default => $ensure },
		force   => true,
		recurse => true,
		owner   => root,
		group   => root,
		mode    => 0644; # rw,r,r
	}

	# collect exported resources
    Bacula::Director::Client <<||>>

}
