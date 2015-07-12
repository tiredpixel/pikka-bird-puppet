class pikka_bird::common::install_python inherits pikka_bird {

  if $pikka_bird::python_manage {
    class { 'python':
      version => $pikka_bird::python_version,
      dev     => $pikka_bird::python_dev,
      pip     => $pikka_bird::python_pip,
    }
  }

}
