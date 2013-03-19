define user::managed($ensure="present", $home="present", $root=false, $groups=["human"], $shell="/bin/bash") {
  include ::user::groups
  include ::user::tools
  include ::sudo

  user {
    "$name":
      ensure => $ensure,
      shell => $shell,
      groups => $groups;
  }

  case $home {
    /^\//: { $_home = $home }
    "present": { $_home = "/home/$name" }
    default: { err("Invalid home directory for user $name: '$home'") }
  }

  if ($ensure == "present") {
    file {
      "$_home":
        ensure => directory,
        require => User[$name],
        owner => $name,
        group => "human",
        mode => 755;
      "$_home/.hushlogin":
        ensure => file,
        owner => $name;
    }

    if ($root) {
      User <| title == $name |> {
        groups +> ["sudo", "adm" ]
      }
    }
  }

  file {
    "/home/$name/.ssh":
      ensure => directory,
      owner => $name,
      mode => 711;
    "/home/$name/.ssh/authorized_keys":
      ensure => $ensure,
      owner => $name,
      mode => 0400,
      source => "puppet:///modules/user/publickeys/$name.pub";
  }
}
