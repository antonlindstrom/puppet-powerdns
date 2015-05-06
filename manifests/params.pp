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

  $package_ldap = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => 'pdns-backend-ldap',
    default              => 'pdns-backend-ldap'
  }

  $package_recursor = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => 'pdns-recursor',
    default              => 'pdns-recursor'
  }

  $postgresql_cfg_path = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => '/etc/pdns/pdns.conf',
    default              => '/etc/powerdns/pdns.d/pdns.local.gpgsql.conf'
  }

  $mysql_cfg_path = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => '/etc/pdns/pdns.conf',
    default              => '/etc/powerdns/pdns.d/pdns.local.gmysql.conf'
  }

  $ldap_cfg_path = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => '/etc/pdns/pdns.conf',
    default              => '/etc/powerdns/pdns.d/pdns.local.ldap.conf'
  }

  $recursor_cfg_path = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => '/etc/pdns/recursor.conf',
    default              => '/etc/powerdns/recursor.conf'
  }

  $cfg_include_name = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => 'include-dir',
    default              => 'include'
  }

  $cfg_include_path = $::operatingsystem ? {
    /(?i:centos|redhat|amazon)/ => '/etc/pdns/conf.d',
    default              => '/etc/powerdns/pdns.d'
  }

}
