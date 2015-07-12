class pikka_bird::collector::install_python inherits pikka_bird::collector {

  if $pikka_bird::collector::python_manage {
    class { 'python':
      version => $pikka_bird::collector::python_version2,
      dev     => $pikka_bird::collector::python_dev,
      pip     => $pikka_bird::collector::python_pip,
    }
  }

}
