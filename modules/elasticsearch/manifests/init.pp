class elasticsearch {
  include java
  user::app { "elasticsearch": ; }

  runit::process {
    "elasticsearch": 
      ensure => present,
      user => "elasticsearch",
      require => [User::App["elasticsearch"], Class["java"]],
      command => "sh elasticsearch.sh",
      directory => "/app/elasticsearch";
  }

  file {
    "/app/elasticsearch/elasticsearch.sh":
      ensure => file,
      notify => Runit::Process["elasticsearch"],
      require => User::App["elasticsearch"],
      mode => 0755,
      owner => "elasticsearch",
      group => "elasticsearch",
      source => "puppet:///modules/elasticsearch/elasticsearch.sh";
  }
}
