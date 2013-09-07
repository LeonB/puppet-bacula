class bacula::client::config inherits bacula::config {

  concat { '/etc/bacula/bacula-fd.conf':
    # ensure  => present,
    owner   => root,
    group   => bacula,
    mode    => 0640, # rw,r,r
    require => Class['bacula::client::package'],
    notify  => Class['bacula::client::service']
  }

  concat::fragment { 'bacula-fd.conf-header':
    target  => '/etc/bacula/bacula-fd.conf',
    content => template('bacula/bacula-fd.conf/header.erb'),
    order   => 10
  }

  concat::fragment { 'bacula-fd.conf-director':
    target  => '/etc/bacula/bacula-fd.conf',
    content => template('bacula/bacula-fd.conf/director.erb'),
    order   => 20
  }

  concat::fragment { 'bacula-fd.conf-filedaemon':
    target  => '/etc/bacula/bacula-fd.conf',
    content => template('bacula/bacula-fd.conf/filedaemon.erb'),
    order   => 30
  }

  # debian specific: file with passwords for dpkg preseeds
  concat::fragment { '/etc/bacula/common_default_passwords.client':
    target  => '/etc/bacula/common_default_passwords',
    content => template('bacula/common_default_passwords/client.erb'),
    order   => 4,
  }

  # if laptop_mode_tools is installed: disable bacula client when on battery
  if defined(laptop_mode_tools::control_service) {
    laptop_mode_tools::control_service { 'bacula-fd': }
  }

  # collect exported resources
  # Bacula::Client::Director <<||>>

  # add to the bacula director (exported resource)
  @@bacula::director::client { $::fqdn:
    password => $bacula::client::password
  } # localhost

}
