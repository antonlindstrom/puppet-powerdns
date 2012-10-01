class powerdns::postgresql(
  $ensure   = 'present',
  $user     = '',
  $password = '',
  $host     = 'localhost',
  $port     = '5432',
  $dbname   = 'pdns',
  $dnssec   = 'yes'
) {

  $postgres_schema = $dnssec ? {
    /(yes|true)/ => 'puppet:///modules/powerdns/postgresql_schema.dnssec.sql',
    default      => 'puppet:///modules/powerdns/postgresql_schema.sql'
  }

  package { 'pdns-backend-pgsql':
    ensure  => $ensure,
    require => Package['pdns-server'],
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
    source  => $postgres_schema,
  }

}
