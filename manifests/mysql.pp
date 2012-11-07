# Public: Install the powerdns mysql backend
#
# package  - which package to install
# ensure   - ensure postgres backend to be present or absent
# source   - where to get the package from
# user     - which user powerdns should connect as
# password - which password to use with user
# host     - host to connect to
# port     - port to connect to
# dbname   - which database to use
# dnssec   - enable or disable dnssec either yes or no
#
class powerdns::mysql(
  $package  = $powerdns::params::package_mysql,
  $ensure   = 'present',
  $source   = '',
  $user     = '',
  $password = '',
  $host     = 'localhost',
  $port     = '3306',
  $dbname   = 'pdns',
  $dnssec   = 'yes'
) inherits powerdns::params {

  $package_source = $source ? {
    ''      => undef,
    default => $source
  }

  $package_provider = $source ? {
    ''      => undef,
    default => $powerdns::params::package_provider
  }

  package { $package:
    ensure   => $ensure,
    require  => Package[$powerdns::params::package],
    provider => $package_provider,
    source   => $package_source
  }

  file { $powerdns::params::mysql_cfg_path:
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0600',
    backup  => '.bak',
    content => template('powerdns/pdns.mysql.local.erb'),
    notify  => Service['pdns'],
    require => Package[$powerdns::params::package],
  }
}
