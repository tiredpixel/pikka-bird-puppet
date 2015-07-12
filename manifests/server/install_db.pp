class pikka_bird::server::install_db inherits pikka_bird::server {

  $version_txt = "${pikka_bird::server::path_etc}/version.txt"

  if $pikka_bird::server::package_manage {
    exec { 'pikka-bird-server-db-migrate':
      command => "${pikka_bird::server::path_daemon} -c database-migrate -d ${pikka_bird::server::database_uri} && `${pikka_bird::server::path_daemon} --version > ${version_txt} 2>&1`",
      path    => $path,
      unless  => "[ \"`${pikka_bird::server::path_daemon} --version 2>&1`\" = \"`cat ${version_txt}`\" ]",
      notify  => Service['pikka-bird-server'],
    }
  }

}
