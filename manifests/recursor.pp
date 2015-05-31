# Public: Install the powerdns-recursor server
#
# package - Name of the package to install
# ensure  - Ensure powerdns to be present or absent
# source  - Source package of powerdns server,
#           default is package provider
#
# configs used into the template:
#   forward_zones
#   forward_zones_recurse
#   local_address
#   local_port
#   log_common_errors
#   logging_facility
#   max_negative_ttl
#   quiet
#   setgid
#   setuid
#   trace
#
# Example:
#
#    # Include with default
#    include powerdns::recursor
#
class powerdns::recursor(
  $package               = $powerdns::params::package_recursor,
  $ensure                = 'present',
  $source                = '',
  $forward_zones         = undef,
  $forward_zones_recurse = undef,
  $local_address         = '127.0.0.1',
  $local_port            = '53',
  $log_common_errors     = 'yes',
  $logging_facility      = undef,
  $max_negative_ttl      = undef,
  $quiet                 = 'yes',
  $setgid                = 'pdns',
  $setuid                = 'pdns',
  $trace                 = 'off',

) inherits powerdns::params {

  require ::powerdns

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

  file { $powerdns::params::recursor_cfg_path:
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('powerdns/recursor.conf.erb'),
    notify  => Service['pdns-recursor'],
    require => Package[$package],
  }

  $ensure_service = $ensure ? {
    'present' => 'running',
    default   => 'stopped'
  }

  service { 'pdns-recursor':
    ensure     => $ensure_service,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package[$package],
  }
}

