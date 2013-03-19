class vagrant::guest {
  file {
    "/home/vagrant/.hushlogin":
      ensure => file,
      content => "",
      owner => vagrant,
      group => vagrant;

  }
}
