class pikka_bird::common::install_pip inherits pikka_bird {

  if $pikka_bird::pip_manage {
    ::python::pip { 'pip':
      ensure  => $pikka_bird::pip_ensure,
      pkgname => $pikka_bird::pip_name,
    }
  }

}
