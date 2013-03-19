class jenkins::package {
  user::app { "jenkins": ; }

  file {
    "/app/jenkins/run.sh": 
      require => User::App["jenkins"],
      owner => jenkins,
      group => jenkins,
      mode => 0755,
      source => "puppet:///modules/jenkins/run.sh";
    "/app/jenkins/.gitconfig":
      ensure => file,
      owner => jenkins,
      group => jenkins,
      content => "[user]\n  name = logstash jenkins\n  email = jls+r.logstash.net@semicomplete.com\n";
  }
}
