class pikka_bird::server (
  $ensure           = 'present',
  $bind_ip          = $pikka_bird::params::server_bind_ip,
  $database_uri     = $pikka_bird::params::server_database_uri,
  $libpq_dev_ensure = $pikka_bird::params::server_libpq_dev_ensure,
  $libpq_dev_manage = $pikka_bird::params::server_libpq_dev_manage,
  $libpq_dev_name   = $pikka_bird::params::server_libpq_dev_name,
  $log_level        = $pikka_bird::params::server_log_level,
  $package_ensure   = $pikka_bird::params::server_package_ensure,
  $package_manage   = $pikka_bird::params::server_package_manage,
  $package_name     = $pikka_bird::params::server_package_name,
  $path             = $pikka_bird::params::server_path,
  $path_config      = $pikka_bird::params::server_path_config,
  $path_daemon      = $pikka_bird::params::server_path_daemon,
  $path_etc         = $pikka_bird::params::server_path_etc,
  $path_init        = $pikka_bird::params::server_path_init,
  $path_log         = $pikka_bird::params::server_path_log,
  $path_manage      = $pikka_bird::params::server_path_manage,
  $path_mode        = $pikka_bird::params::server_path_mode,
  $path_pid         = $pikka_bird::params::server_path_pid,
  $port             = $pikka_bird::params::server_port,
  $service_enable   = $pikka_bird::params::server_service_enable,
  $service_ensure   = $pikka_bird::params::server_service_ensure,
  $service_manage   = $pikka_bird::params::server_service_manage,
  $service_name     = $pikka_bird::params::server_service_name,
  $user_name        = $pikka_bird::params::server_user_name,
  $workers          = $pikka_bird::params::server_workers,
) inherits pikka_bird::params {

  $ensure_d = $ensure ? {
    'present' => 'directory',
    default   => $ensure,
  }

  include '::pikka_bird::server::config'
  include '::pikka_bird::server::install'
  include '::pikka_bird::server::install_db'
  include '::pikka_bird::server::install_libs'
  include '::pikka_bird::server::service'

  anchor { 'pikka_bird::server::start': }
  anchor { 'pikka_bird::server::end': }

  Anchor['pikka_bird::server::start'] ->
  Class['pikka_bird::server::install_libs'] ->
  Class['pikka_bird::server::install'] ->
  Class['pikka_bird::server::config'] ->
  Class['pikka_bird::server::install_db'] ->
  Class['pikka_bird::server::service'] ->
  Anchor['pikka_bird::server::end']

}
