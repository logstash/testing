class user::humans {
  user::managed {
    "jls": ensure => present, root => true;
    "nethier": ensure => present;
  }
}

