class logstash($revision="master") {
  include git
  include java
  user::app { "logstash": ;  }

  vcsrepo {
    "/app/logstash/logstash":
      ensure => latest,
      require => User::App["logstash"],
      owner => "logstash",
      provider => "git",
      revision => $revision,
      source => "https://github.com/logstash/logstash"
  }
}
