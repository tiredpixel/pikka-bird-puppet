class pikka_bird::server::service inherits pikka_bird::server {

  if $service_manage == true {
    service { 'pikka-bird-server':
      ensure     => $service_ensure,
      enable     => $service_enable,
      hasrestart => true,
      hasstatus  => true,
      name       => $service_name,
    }
  }

}
