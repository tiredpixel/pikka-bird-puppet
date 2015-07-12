class pikka_bird::server::install_libs inherits pikka_bird::server {

  if $pikka_bird::server::libpq_dev_manage {
    package { 'libpq-dev':
      ensure => $pikka_bird::server::libpq_dev_ensure,
      name   => $pikka_bird::server::libpq_dev_name,
    }
  }

}
