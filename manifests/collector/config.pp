class pikka_bird::collector::config inherits pikka_bird::collector {

  if $pikka_bird::collector::path_manage {
    file { 'pikka-bird-collector-config':
      ensure  => $ensure,
      mode    => $pikka_bird::collector::path_mode_file,
      path    => $pikka_bird::collector::path_config,
      content => template('pikka_bird/collector/default.env.erb'),
      notify  => Service['pikka-bird-collector'],
    }

    file { 'pikka-bird-collector-init':
      ensure  => $ensure,
      mode    => '0755',
      path    => $pikka_bird::collector::path_init,
      content => template('pikka_bird/collector/init.sh.erb'),
      notify  => Service['pikka-bird-collector'],
    }
  }

}
