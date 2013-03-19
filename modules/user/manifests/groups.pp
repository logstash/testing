class user::groups {
  group {
    "sudo": ensure => present;
    "human": ensure => present;
    "apps": ensure => present;
  }
}
