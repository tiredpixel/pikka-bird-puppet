class pikka_bird::collector::service inherits pikka_bird::collector {

  if $service_manage == true {
    service { 'pikka-bird-collector':
      ensure     => $service_ensure,
      enable     => $service_enable,
      hasrestart => true,
      hasstatus  => true,
      name       => $service_name,
    }
  }

}
