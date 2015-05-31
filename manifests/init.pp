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
class etchosts (
  $manage_ruby = $etchosts::params::manage_ruby,
) inherits etchosts::params {
  if $manage_ruby == true {
    package { 'ruby':
      ensure => installed,
    }
  }
  concat { '/etc/hosts':
    ensure => present,
  }
  concat::fragment {'etchostsheader':
    target  => '/etc/hosts',
    source  => 'puppet:///modules/etchosts/hosts-header',
    order   => '01',
  }
  Concat::Fragment <<| tag == 'hostsentries' |>>
} 
