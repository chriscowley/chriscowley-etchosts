# == Class: etchosts
#
# Create an `/etc/hosts` file based on exported resources
#
# === Examples
#
# On the system to have the `/etc/hosts` file:
#
# class {'etchosts': }
#
# On each system to be included in the `/etc/hosts` file
#
# class { 'etchosts::client': }
#
#
# === Authors
#
# Chris Cowley <chris@chriscowley.me.uk>
#
# === Copyright
#
# Copyright 2015
#
class etchosts {
  concat { '/etc/hosts':
    ensure => present,
  }
  concat::fragment {'etchostsheader':
    target  => '/etc/hosts',
    content => '# File controlled by Puppet, changes will be overwritten',
    order   => '01',
  }
  Concat::Fragment <<| tag == 'hostsentries' |>>
}
