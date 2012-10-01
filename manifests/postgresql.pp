class powerdns::postgresql(
  $package  = $powerdns::params::package_psql,
  $ensure   = 'present',
  $source   = '',
  $user     = '',
  $password = '',
  $host     = 'localhost',
  $port     = '5432',
  $dbname   = 'pdns',
  $dnssec   = 'yes'
) inherits powerdns::params {

  $postgres_schema = $dnssec ? {
    /(yes|true)/ => 'puppet:///modules/powerdns/postgresql_schema.dnssec.sql',
    default      => 'puppet:///modules/powerdns/postgresql_schema.sql'
  }

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
    require  => Package['pdns-server'],
    provider => $package_provider,
    source   => $package_source
  }

  file { '/etc/powerdns/pdns.d/pdns.local.gpgsql':
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('powerdns/pdns.pgsql.local.erb'),
    notify  => Service['pdns'],
    require => Package['pdns-server'],
  }

  file { '/opt/powerdns_schema.sql':
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => $postgres_schema
  }

}
