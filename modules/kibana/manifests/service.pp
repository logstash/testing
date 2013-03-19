class kibana::service {
  include ::kibana::package

  rvm::install {
    "for kibana":
      user => "kibana";
  }

  runit::process {
    "kibana":
      ensure => present,
      user => "kibana",
      require => [Class["kibana::package"], Rvm::Install["for kibana"], File["/app/kibana/kibana_conf.rb"]],
      command => "env KIBANA_CONFIG=/app/kibana/kibana_conf.rb ruby kibana.rb",
      directory => "/app/kibana/kibana";
  }

  file {
    "/app/kibana/kibana_conf.rb":
      ensure => file,
      require => Class["kibana::package"],
      notify => Runit::Process["kibana"],
      owner => "kibana",
      group => "kibana",
      source => "puppet:///modules/kibana/KibanaConfig.rb";
  }
}
