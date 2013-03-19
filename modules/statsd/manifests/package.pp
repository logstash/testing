class statsd::package {
  user::app { "statsd": ; }

  package {
    "nodejs": ensure => latest;
  }

  vcsrepo {
    "/app/statsd/statsd":
      ensure => latest,
      revision => "master",
      require => User::App["statsd"],
      owner => "statsd",
      provider => "git",
      source => "https://github.com/etsy/statsd.git"
  }
}
