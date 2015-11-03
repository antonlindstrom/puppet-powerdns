# Internal: Install the powerdns package
#
# Example:
#
#    include powerdns::package
#
class powerdns::package(
  $package      = $powerdns::params::package,
  $ensure       = 'present',
  $source       = '',
  $purge_config = false,
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
    source   => $package_source,
    provider => $package_provider
  }

  file { $powerdns::params::cfg_include_path :
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => $purge_config,
    purge   => $purge_config,
    require => Package[$package],
  }

  $pdns_config = hiera('pdns::config','')
  file { "$powerdns::params::cfg_include_path/authoritive.conf":
    ensure  => present,
    content => template('powerdns/authoritive-conf.erb'),
    owner   => 'root',
    group   => 'root',
    require => Package[$package],
    notify  => Class['::powerdns::service']
  }

}
