class shatty::package {
  user::app { "shatty": ; }

  vcsrepo {
    "/app/shatty/shatty":
      ensure => latest,
      require => User::App["shatty"],
      owner => "shatty",
      provider => "git",
      revision => "master",
      source => "https://github.com/jordansissel/shatty"
  }

  rvm::install {
    "for shatty":
      user => "shatty";
  }
}
