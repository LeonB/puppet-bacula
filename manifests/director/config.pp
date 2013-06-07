class bacula::director::config inherits bacula::config {

  $directory_ensure = bacula::director::ensure ? {
    present => directory,
    default => $bacula::director::ensure
  }

  file { '/etc/bacula/bacula-dir.conf':
    ensure  => $bacula::director::ensure,
    content => template('bacula/bacula-dir.conf.erb'),
    require => Class['bacula::director::package'],
    notify  => Class['bacula::director::service']
  }

    file {
    [
      '/etc/bacula/scripts/btraceback.gdb',
      '/etc/bacula/scripts/query.sql',
    ]:
      ensure  => $bacula::director::ensure,
      owner   => root,
      group   => bacula,
      mode    => '0640'; # rw,r
    }

  file { '/etc/bacula/bacula-dir.d/':
    ensure  => $directory_ensure,
    force   => true,
    recurse => true,
    owner   => root,
    group   => bacula,
    mode    => '0640'; # rw,r,r
  }

  # debian specific
    concat::fragment { '/etc/bacula/common_default_passwords.director':
      target  => '/etc/bacula/common_default_passwords',
      content => template('bacula/common_default_passwords/director.erb'),
      order   => 2,
    }

  # collect exported resources
  Bacula::Director::Client <<||>>

}
