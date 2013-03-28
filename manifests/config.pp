class bacula::config {
	include bacula

        file { '/etc/bacula/':
                ensure  => $bacula::ensure ? { present => directory, default => $ensure },
                force   => true,
                recurse => true,
                owner   => root,
                group   => bacula,
                mode    => 0640; # rw,r
        }

        file { '/etc/bacula/scripts/':
                ensure  => $bacula::ensure ? { present => directory, default => $ensure },
                force   => true,
                recurse => true,
                owner   => root,
                group   => bacula,
                mode    => 0750; # rwx,rx
        }

	users::account { $bacula::user:
	    ensure  => $sabnzbdplus::ensure,
	    uid     => 120,
	    home    => '/var/lib/bacula',
	    shell   => '/bin/false',
	    comment => 'Bacula',
	}

}
