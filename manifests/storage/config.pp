class bacula::storage::config {

    file { '/etc/bacula/bacula-sd.conf':
        ensure  => present,
        content => template("bacula/bacula-sd.conf.erb"),
        require => Class['bacula::storage::package'],
        notify  => Class['bacula::storage::service']
    }

}
