class powerdns::params {

  $package = $::operatingsystem ? {
    /(?i:centos|redhat)/ => 'pdns',
    default              => 'pdns-server'
  }

  $package_provider = $::operatingsystem ? {
    /(?i:centos|redhat)/  => 'rpm',
    default               => 'dpkg'
  }

  $package_psql = $::operatingsystem ? {
    /(?i:centos|redhat)/ => 'pdns-backend-postgresql',
    default              => 'pdns-backend-pgsql'
  }

}