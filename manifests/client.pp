# == Class: etchosts::client
#
# To be included on a host that will added to the `/etc/hosts` file of your
# DNS server
#
class etchosts::client {
  @@concat::fragment { "hostsentry_${::hostname}":
    target  => '/etc/hosts',
    content => "${::ipaddress} ${::hostname}",
    tag     => 'hostsentries',
  }
}
