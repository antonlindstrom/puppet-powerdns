# Public: Install the powerdns sqlite backend
#
# package  - which package to install
# ensure   - ensure mysql backend to be present or absent
# source   - where to get the package from
# user     - which user powerdns should connect as
# password - which password to use with user
# host     - host to connect to
# port     - port to connect to
# dbname   - which database to use
# dnssec   - enable or disable dnssec either yes or no
#
class powerdns::sqlite(
  $package  = $powerdns::params::package_sqlite,
  $ensure   = 'present',
  $source   = '',
  $dnssec   = 'yes',
  $database_path = "/etc/pdns/pdns.db",
  $sqlite_synchronous = 'off',
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

  file { $powerdns::params::sqlite_cfg_path:
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0600',
    backup  => '.bak',
    content => template('powerdns/pdns.sqlite.local.erb'),
    notify  => Service['pdns'],
    require => Package[$powerdns::params::package],
  }
}
