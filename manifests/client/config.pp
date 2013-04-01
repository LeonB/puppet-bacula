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

    # debian specific
    concat::fragment { '/etc/bacula/common_default_passwords.client':
        target  => '/etc/bacula/common_default_passwords',
        content => template('bacula/common_default_passwords/client.erb'),
        order   => 4,
    }

    # add to the bacula director (exported resource)
    @@bacula::director::client { $fqdn:
        password => $bacula::client::password
    } # localhost

}
