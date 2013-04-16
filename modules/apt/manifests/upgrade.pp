class apt::upgrade {
  include apt::params
  include apt::update

  exec { 'apt_upgrade':
    command => "${apt::params::provider} upgrade -y",
    timeout => 1800,
    require => Exec["apt_update"];
  }

  Package <| |> {
    require => Exec["apt_upgrade"]
  }
}
