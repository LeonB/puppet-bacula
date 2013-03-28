class bacula::director::config inherits bacula::config {

	file { '/etc/bacula/bacula-dir.conf':
        ensure  => $bacula::director::ensure,
        content => template("bacula/bacula-dir.conf.erb"),
        require => Class['bacula::director::package'],
        notify  => Class['bacula::director::service']
	}

        file {
		[
			'/etc/bacula/scripts/btraceback.gdb',
			'/etc/bacula/scripts/mtx-changer.conf',
			'/etc/bacula/scripts/query.sql',
		]:
                	ensure  => $bacula::director::ensure,
	                owner   => root,
	                group   => bacula,
	                mode    => 0640; # rw,r
        }

	file { '/etc/bacula/bacula-dir.d/':
		ensure  => $bacula::director::ensure ? { present => directory, default => $ensure },
		force   => true,
		recurse => true,
		owner   => root,
		group   => bacula,
		mode    => 0640; # rw,r,r
	}

	# collect exported resources
	Bacula::Director::Client <<||>>

}
