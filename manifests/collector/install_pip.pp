class pikka_bird::collector::install_pip inherits pikka_bird::collector {

  if $pikka_bird::collector::pip_manage {
    ::python::pip { 'pip':
      ensure  => $pikka_bird::collector::pip_ensure,
      pkgname => $pikka_bird::collector::pip_name,
    }
  }

}
