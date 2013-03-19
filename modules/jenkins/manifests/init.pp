class jenkins {
  include ::jenkins::package
  include ::jenkins::service

  # Purge any old jenkins repo stuff I don't use anymore.
  # TODO(sissel): Safe to remove this section after 2012/11/01 (jls)
  apt::source {
    "jenkins": ensure => absent;
  }
}
