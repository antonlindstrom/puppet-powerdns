# Public: Install the powerdns ldap backend
#
# package  - which package to install
# ensure   - ensure postgres backend to be present or absent
# source   - where to get the package from
# ldap_host   - host to connect to
# ldap_basedn - which base in the ldap we must be searched in
# ldap_binddn - which user powerdns should connect as
# ldap_secret - which password to use with user
#
class powerdns::ldap(
  $package     = $powerdns::params::package_ldap,
  $ensure      = 'present',
  $source      = '',
  $ldap_host   = '',
  $ldap_basedn = '',
  $ldap_binddn = '',
  $ldap_secret = '',
) inherits powerdns::params {

  require ::powerdns::package

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

  file { $powerdns::params::ldap_cfg_path:
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('powerdns/pdns.ldap.local.erb'),
    notify  => Service['pdns'],
    require => Package[$package],
  }
}

