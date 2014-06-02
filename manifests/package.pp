# Internal: Install the powerdns package
#
# Example:
#
#    include powerdns::package
#
class powerdns::package(
  $package = $powerdns::params::package,
  $ensure = 'present',
  $source = ''
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

  file { $cfg_include_path :
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}
