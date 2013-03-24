class bacula::config {
	include bacula

	users::account { $bacula::user:
	    ensure  => $sabnzbdplus::ensure,
	    uid     => 120,
	    home    => '/var/lib/bacula',
	    shell   => '/bin/false',
	    comment => 'Bacula',
	}

}
