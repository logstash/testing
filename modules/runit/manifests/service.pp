class runit::service {
  include ::runit::package

  service {
    "runsvdir":
      ensure => running,
      require => Class["runit::package"],
      enable => true;
  }
}
