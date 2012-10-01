class powerdns::params {

  $package = 'pdns-server'

  $package_provider = $::operatingsystem ? {
    /(?i:centos|redhat)/  => 'rpm',
    default               => 'dpkg'
  }

  $package_psql = 'pdns-backend-pgsql'

}