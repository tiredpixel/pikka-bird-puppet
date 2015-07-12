class pikka_bird::server::config inherits pikka_bird::server {

  if $pikka_bird::server::path_manage {
    file { 'pikka-bird-server-config':
      ensure  => $ensure,
      mode    => $pikka_bird::server::path_mode_file,
      path    => $pikka_bird::server::path_config,
      content => template('pikka_bird/server/default.env.erb'),
      notify  => Service['pikka-bird-server'],
    }

    file { 'pikka-bird-server-init':
      ensure  => $ensure,
      mode    => '0755',
      path    => $pikka_bird::server::path_init,
      content => template('pikka_bird/server/init.sh.erb'),
      notify  => Service['pikka-bird-server'],
    }
  }

}
