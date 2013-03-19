class statsd::service {
  include ::statsd::package

  runit::process {
    "statsd":
      ensure => present,
      user => "statsd",
      require => Class["statsd::package"],
      command => "node stats.js statsd.conf",
      directory => "/app/statsd/statsd";
  }

  file {
    "/app/statsd/statsd/statsd.conf":
      ensure => file,
      notify => Runit::Process["statsd"],
      owner => "statsd",
      group => "statsd",
      source => "puppet:///modules/statsd/statsd.conf";
  }
}
