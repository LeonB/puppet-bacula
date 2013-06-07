class bacula::storage::package {

  package  { $bacula::storage::package_name:
    ensure => present
  }
}
