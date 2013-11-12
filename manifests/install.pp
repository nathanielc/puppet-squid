
class squid::install inherits squid {

    package { 'squid' :
        ensure => $package_ensure,
        name   => $package_name,
    }
}
