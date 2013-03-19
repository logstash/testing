class redis::package {
  user::app { "redis": ; }

  file {
    "/app/redis/Makefile":
      ensure => file,
      source => "puppet:///modules/redis/Makefile";
  }
}
