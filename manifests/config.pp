class bacula::config {
  include bacula

  $directory_ensure = $bacula::ensure ? {
    present => directory,
    default => $bacula::ensure
  }

    file { '/etc/bacula/':
      ensure  => $directory_ensure,
      force   => true,
      recurse => true,
      owner   => root,
      group   => bacula,
      mode    => '0640'; # rw,r
    }

    file { '/etc/bacula/scripts/':
      ensure  => $directory_ensure,
      force   => true,
      recurse => true,
      owner   => root,
      group   => bacula,
      mode    => '0750'; # rwx,rx
    }

  users::account { $bacula::user:
      ensure  => $bacula::ensure,
      uid     => 160,
      home    => '/var/lib/bacula',
      shell   => '/bin/false',
      comment => 'Bacula',
  }

    # debian specific
    concat { '/etc/bacula/common_default_passwords':
            owner => root,
            group => bacula,
            mode  => '0640', # rw,r
    }

    concat::fragment { '/etc/bacula/common_default_passwords.head':
        target => '/etc/bacula/common_default_passwords',
        source => 'puppet:///modules/bacula/common_default_passwords.head',
        order  => 1,
    }

}
