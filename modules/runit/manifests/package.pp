class runit::package {
  package {
    "runit": ensure => latest;
  }

  user {
    "runitlog": ensure => present;
  }

  file {
    "/etc/service":
      ensure => directory;
    "/service":
      ensure => link,
      target => "/etc/service";
    "/var/log/service":
      ensure => directory,
      owner => root;
  }
}
