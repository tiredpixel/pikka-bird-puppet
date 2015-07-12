# == Class: pikka_bird
#
# Full description of class pikka_bird here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the function of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'pikka_bird':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class pikka_bird (
  $pip_ensure     = $pikka_bird::params::pip_ensure,
  $pip_manage     = $pikka_bird::params::pip_manage,
  $pip_name       = $pikka_bird::params::pip_name,
  $python_dev     = $pikka_bird::params::python_dev,
  $python_manage  = $pikka_bird::params::python_manage,
  $python_pip     = $pikka_bird::params::python_pip,
  $python_version = $pikka_bird::params::python_version,
  $user_manage    = $pikka_bird::params::user_manage,
  $user_name      = $pikka_bird::params::user_name,
) inherits pikka_bird::params {

  include '::pikka_bird::install'
  include '::pikka_bird::install_pip'
  include '::pikka_bird::install_python'

  anchor { 'pikka_bird::start': }
  anchor { 'pikka_bird::end': }

  Anchor['pikka_bird::start'] ->
  Class['pikka_bird::install_python'] ->
  Class['pikka_bird::install_pip'] ->
  Class['pikka_bird::install'] ->
  Anchor['pikka_bird::end']

}
