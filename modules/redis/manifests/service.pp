class redis::service {
  include ::redis::package

  runit::process {
    "redis":
      ensure => present,
      user => "redis",
      require => Class["redis::package"],
      command => "/app/redis/run.sh",
      directory => "/app/redis";
  }

  file {
    "/app/redis/redis.conf":
      ensure => file,
      require => Class["redis::package"],
      notify => Runit::Process["redis"],
      owner => "redis",
      group => "redis",
      source => "puppet:///modules/redis/redis.conf";
    "/app/redis/run.sh":
      ensure => file,
      require => Class["redis::package"],
      notify => Runit::Process["redis"],
      mode => 755,
      owner => "redis",
      group => "redis",
      source => "puppet:///modules/redis/run.sh";
  }
}
