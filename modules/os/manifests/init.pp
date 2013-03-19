class os {
  package {
    "g++": ensure => latest;
  }

  file {
    "/etc/security/limits.conf":
      ensure => file,
      owner => root,
      group => root,
      source => "puppet:///modules/os/limits.conf";
    "/etc/motd":
      ensure => file,
      content => template("os/motd.erb");
  }
}
