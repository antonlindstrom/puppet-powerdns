class powerdns::postgresql(
  $user='',
  $password='',
  $host='localhost',
  $port='5432',
  $dbname='pdns',
  $ensure='present'
) {

  package { 'pdns-backend-pgsql':
    ensure  => $ensure,
    require => Package['powerdns'],
  }

  file { '/etc/powerdns/pdns.d/pdns.local':
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('powerdns/pdns.pgsql.local.erb'),
    notify  => Service['powerdns'],
  }

}
