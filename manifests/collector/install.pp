class pikka_bird::collector::install inherits pikka_bird::collector {

  if $pikka_bird::collector::user_manage {
    user { 'pikka-bird':
      ensure => $ensure,
      name   => $pikka_bird::collector::user_name,
      system => true,
    }
  }

  if $pikka_bird::collector::package_manage {
    ::python::pip { 'pikka-bird-collector':
      ensure  => $pikka_bird::collector::package_ensure2,
      pkgname => $pikka_bird::collector::package_name,
      notify  => Service['pikka-bird-collector'],
    }
  }

  if $ensure != 'absent' and $pikka_bird::collector::path_manage {
    file { 'pikka-bird-collector-etc':
      ensure => $ensure_d,
      mode   => $pikka_bird::collector::path_mode_dir,
      owner  => $pikka_bird::collector::user_name,
      path   => $pikka_bird::collector::path_etc,
    }

    file { 'pikka-bird-collector-conf':
      ensure => $ensure_d,
      mode   => $pikka_bird::collector::path_mode_dir,
      owner  => $pikka_bird::collector::user_name,
      path   => $pikka_bird::collector::path_conf,
    }

    file { 'pikka-bird-collector-log':
      ensure => $ensure_d,
      mode   => $pikka_bird::collector::path_mode_dir,
      owner  => $pikka_bird::collector::user_name,
      path   => $pikka_bird::collector::path_log,
    }
  }

}
