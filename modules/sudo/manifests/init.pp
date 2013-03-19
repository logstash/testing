class sudo {
  package {
    "sudo": ensure => latest;
  }

  file {
    "/etc/sudoers":
      owner => root,
      group => root,
      mode => 440,
      require => Package["sudo"],
      source => "puppet:///modules/sudo/sudoers";
  }
}
