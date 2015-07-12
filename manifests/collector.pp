class pikka_bird::collector (
  $ensure         = 'present',
  $format         = $pikka_bird::params::collector_format,
  $interval       = $pikka_bird::params::collector_interval,
  $log_level      = $pikka_bird::params::log_level,
  $package_ensure = $pikka_bird::params::collector_package_ensure,
  $package_manage = $pikka_bird::params::collector_package_manage,
  $package_name   = $pikka_bird::params::collector_package_name,
  $path           = $pikka_bird::params::path,
  $path_conf      = $pikka_bird::params::collector_path_conf,
  $path_config    = $pikka_bird::params::collector_path_config,
  $path_daemon    = $pikka_bird::params::collector_path_daemon,
  $path_etc       = $pikka_bird::params::collector_path_etc,
  $path_init      = $pikka_bird::params::collector_path_init,
  $path_log       = $pikka_bird::params::collector_path_log,
  $path_manage    = $pikka_bird::params::collector_path_manage,
  $path_mode      = $pikka_bird::params::path_mode,
  $path_pid       = $pikka_bird::params::collector_path_pid,
  $server_uri     = $pikka_bird::params::collector_server_uri,
  $service_enable = $pikka_bird::params::collector_service_enable,
  $service_ensure = $pikka_bird::params::collector_service_ensure,
  $service_manage = $pikka_bird::params::collector_service_manage,
  $service_name   = $pikka_bird::params::collector_service_name,
  $user_name      = $pikka_bird::params::user_name,
) inherits pikka_bird::params {

  $ensure_d = $ensure ? {
    'present' => 'directory',
    default   => $ensure,
  }

  include '::pikka_bird::collector::config'
  include '::pikka_bird::collector::install'
  include '::pikka_bird::collector::service'

  anchor { 'pikka_bird::collector::start': }
  anchor { 'pikka_bird::collector::end': }

  Anchor['pikka_bird::collector::start'] ->
  Class['pikka_bird::collector::install'] ->
  Class['pikka_bird::collector::config'] ->
  Class['pikka_bird::collector::service'] ->
  Anchor['pikka_bird::collector::end']

}
