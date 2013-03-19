class apt::update {
  include apt::params

  exec { 'apt_update':
    command     => "${apt::params::provider} update",
    refreshonly => true,
  }

  Package <| |> {
    require => Exec["apt_update"]
  }
}
