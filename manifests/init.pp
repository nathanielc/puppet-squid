
class squid (
    $package_name   = $squid::params::package_name,
    $package_ensure = $squid::params::package_ensure,
    $service_enable = $squid::params::service_enable,
    $service_ensure = $squid::params::service_ensure,
    $service_manage = $squid::params::service_manage,
    $service_name   = $squid::params::service_name,
) inherits squid::params {

    validate_string($package_ensure)
    validate_array($package_name)
    validate_bool($service_enable)
    validate_string($service_ensure)
    validate_bool($service_manage)
    validate_string($service_name)


    anchor { 'squid::begin': } ->
    class { '::squid::install': } ->
    class { '::squid::config': } ~>
    class { '::squid::service': } ->
    anchor { 'squid::end': }

}
