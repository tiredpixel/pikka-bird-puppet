class pikka_bird::install inherits pikka_bird {

  if $pikka_bird::user_manage {
    user { 'pikka-bird':
      ensure => $ensure,
      name   => $pikka_bird::user_name,
      system => true,
    }
  }

}
