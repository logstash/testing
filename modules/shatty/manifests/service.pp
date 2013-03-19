class shatty::service {
  include ::shatty::package

  runit::process {
    "shatty":
      ensure => present,
      user => "shatty",
      require => Class["shatty::package"],
      command => "env PORT=8200 ruby web.rb",
      directory => "/app/shatty/shatty";
      # TODO(sissel): add webshell process, too
  }

  include apache
  include apache::params
  include apache::mod::default

  file {
    "$apache::params::vdir/shatty.conf":
      ensure => file,
      source => "puppet:///modules/shatty/shatty.httpd.conf",
      # I don't like notifying an external service (defined by the 'apache' class)
      # but the puppetlabs/apache module defines it there and until I patch it
      # this is what is required. After fixing the apache module, I'll be
      # able to do: notify => Class["apache::service"]
      notify => Service["httpd"];
  }
}
