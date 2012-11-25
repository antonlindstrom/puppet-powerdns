# Internal: Set default parameters
#
# Example:
#
#    include powerdns::params
#
class powerdns::params {

  $package = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => 'pdns',
    default              => 'pdns-server'
  }

  $package_provider = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/  => 'rpm',
    default               => 'dpkg'
  }

  $package_psql = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => 'pdns-backend-postgresql',
    default              => 'pdns-backend-pgsql'
  }

  $package_mysql = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => 'pdns-backend-mysql',
    default              => 'pdns-backend-mysql'
  }

  $postgresql_cfg_path = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => '/etc/pdns/pdns.conf',
    default              => '/etc/powerdns/pdns.d/pdns.local.gpgsql'
  }

  $mysql_cfg_path = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => '/etc/pdns/pdns.conf',
    default              => '/etc/powerdns/pdns.d/pdns.local.mysql'
  }

}
