class user {
  file {
    "/home": ensure => directory;
    "/home/app": ensure => directory;
    "/app": ensure => link, target => "/home/app";
  }
}
