define rvm::install (
  $user, # the user to install for
  $ensure="stable"
) {
  include rvm::files
  include curl

  exec {
    "get rvm for $user":
      require => [User[$user], Class["rvm::files"], Class["curl"]],
      command => "bash /usr/bin/bootstrap-rvm.bash $branch",
      user => $user,
      path => [ "/bin", "/sbin", "/usr/bin", "/usr/sbin", "/usr/local/bin" ];
  }
}
