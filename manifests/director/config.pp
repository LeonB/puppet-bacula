class bacula::director::config {

	file { '/etc/bacula/bacula-dir.conf':
        ensure  => present,
        content => template("bacula/bacula-dir.conf.erb"),
        require => Class['bacula::director::package'],
        notify  => Class['bacula::director::service']
	}

	# collect exported resources
    Bacula::Director::Client <<||>>

}
