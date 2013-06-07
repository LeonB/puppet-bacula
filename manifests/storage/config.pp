class bacula::storage::config inherits bacula::config {

  file { '/etc/bacula/bacula-sd.conf':
    ensure  => present,
    content => template('bacula/bacula-sd.conf.erb'),
    require => Class['bacula::storage::package'],
    notify  => Class['bacula::storage::service']
  }

  file {
  [
    '/etc/bacula/scripts/mtx-changer.conf',
  ]:
    ensure  => $bacula::director::ensure,
    owner   => root,
    group   => bacula,
    mode    => '0640'; # rw,r
  }

  # debian specific
  concat::fragment { '/etc/bacula/common_default_passwords.storage':
    target  => '/etc/bacula/common_default_passwords',
    content => template('bacula/common_default_passwords/storage.erb'),
    order   => 3,
  }

}
