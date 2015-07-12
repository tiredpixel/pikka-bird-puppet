class pikka_bird::server::install inherits pikka_bird::server {

  if $pikka_bird::server::package_manage {
    ::python::pip { 'pikka-bird-server':
      ensure  => $pikka_bird::server::package_ensure,
      pkgname => $pikka_bird::server::package_name,
      notify  => Service['pikka-bird-server'],
    }
  }

  if $pikka_bird::server::path_manage {
    file { 'pikka-bird-server-etc':
      ensure  => $ensure_d,
      mode    => $pikka_bird::server::path_mode_dir,
      owner   => $pikka_bird::server::user_name,
      path    => $pikka_bird::server::path_etc,
    }

    file { 'pikka-bird-server-log':
      ensure  => $ensure_d,
      mode    => $pikka_bird::server::path_mode_dir,
      owner   => $pikka_bird::server::user_name,
      path    => $pikka_bird::server::path_log,
    }
  }

}
