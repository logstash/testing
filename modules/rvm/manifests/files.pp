class rvm::files {
  file {
    "/usr/bin/bootstrap-rvm.bash":
      ensure => file,
      mode => 755,
      owner => root,
      group => root,
      source => "puppet:///modules/rvm/bootstrap-rvm.bash";
  }
}

