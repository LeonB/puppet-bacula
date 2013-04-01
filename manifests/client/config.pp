class bacula::client::config inherits bacula::config {

	file { '/etc/bacula/bacula-fd.conf':
        ensure  => present,
                owner   => root,
                group   => bacula,
                mode    => 0640, # rw,r,r
        content => template("bacula/bacula-fd.conf.erb"),
        require => Class['bacula::client::package'],
        notify  => Class['bacula::client::service']
	}

	# add to the bacula director (exported resource)
	@@bacula::director::client { $fqdn:
		password => $bacula::client::password
	} # localhost

}
