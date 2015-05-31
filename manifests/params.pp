class etchosts::params {
  case $::osfamily {
    'RedHat', 'Amazon': {
      $manage_ruby = true
    }
    'Debian': {
      $manage_ruby = true
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
