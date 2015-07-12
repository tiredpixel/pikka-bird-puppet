class pikka_bird::params {

  # collector
  $collector_format         = 'binary'
  $collector_interval       = 60
  $collector_log_level      = 'INFO'
  $collector_package_ensure = 'present'
  $collector_package_manage = true
  $collector_package_name   = 'pikka-bird-collector'
  $collector_path           = '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin'
  $collector_path_conf      = '/etc/pikka-bird-collector/conf.d'
  $collector_path_config    = '/etc/default/pikka-bird-collector'
  $collector_path_daemon    = '/usr/local/bin/pikka-bird-collector'
  $collector_path_etc       = '/etc/pikka-bird-collector'
  $collector_path_init      = '/etc/init.d/pikka-bird-collector'
  $collector_path_log       = '/var/log/pikka-bird-collector'
  $collector_path_manage    = true
  $collector_path_mode_dir  = '0750'
  $collector_path_mode_file = '0640'
  $collector_path_pid       = '/var/run/pikka-bird-collector.pid'
  $collector_pip_ensure     = 'latest'
  $collector_pip_manage     = true
  $collector_pip_name       = 'pip'
  $collector_python_dev     = true
  $collector_python_manage  = true
  $collector_python_pip     = true
  $collector_python_version = 'system'
  $collector_server_uri     = "http://pikka-bird:${server_port}"
  $collector_service_enable = true
  $collector_service_ensure = 'running'
  $collector_service_manage = true
  $collector_service_name   = 'pikka-bird-collector'
  $collector_user_manage    = true
  $collector_user_name      = 'pikka-bird'

  # server
  $server_bind_ip          = '0.0.0.0'
  $server_database_uri     = 'postgresql://pikka_bird:@localhost:5432/pikka_bird'
  $server_libpq_dev_ensure = 'present'
  $server_libpq_dev_manage = true
  $server_libpq_dev_name   = 'libpq-dev'
  $server_log_level        = 'INFO'
  $server_package_ensure   = 'present'
  $server_package_manage   = true
  $server_package_name     = 'pikka-bird-server'
  $server_path             = '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin'
  $server_path_config      = '/etc/default/pikka-bird-server'
  $server_path_daemon      = '/usr/local/bin/pikka-bird-server'
  $server_path_etc         = '/etc/pikka-bird-server'
  $server_path_init        = '/etc/init.d/pikka-bird-server'
  $server_path_log         = '/var/log/pikka-bird-server'
  $server_path_manage      = true
  $server_path_mode_dir    = '0750'
  $server_path_mode_file   = '0640'
  $server_path_pid         = '/var/run/pikka-bird-server.pid'
  $server_port             = 8042
  $server_service_enable   = true
  $server_service_ensure   = 'running'
  $server_service_manage   = true
  $server_service_name     = 'pikka-bird-server'
  $server_user_name        = 'pikka-bird'
  $server_workers          = 16

}
