class jenkins::service {
  include ::jenkins::package

  include apache
  include apache::params
  include apache::mod::default

  file {
    "$apache::params::vdir/r.conf":
      ensure => file,
      source => "puppet:///modules/jenkins/jenkins.httpd.conf",
      # I don't like notifying an external service (defined by the 'apache' class)
      # but the puppetlabs/apache module defines it there and until I patch it
      # this is what is required. After fixing the apache module, I'll be
      # able to do: notify => Class["apache::service"]
      notify => Service["httpd"];
  }

  runit::process {
    "jenkins":
      ensure => present,
      user => "jenkins",
      require => Class["jenkins::package"],
      command => "sh run.sh",
      directory => "/app/jenkins";
  }
}
