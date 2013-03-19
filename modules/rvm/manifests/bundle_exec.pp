define rvm::bundle_exec(
  $command,
  $user,
  $directory,
  $refreshonly = false,
  $path = [ "/bin", "/sbin", "/usr/sbin", "/usr/bin", "/usr/local/bin", "/usr/local/sbin" ]
) {

  exec {
    "bundle exec - $title":
      command => template("rvm/bundle_exec.sh.erb"),
      provider => shell,
      environment => [ "LANG=en_US.UTF-8", "LC_ALL=en_US.UTF-8" ],
      user => $user,
      refreshonly => $refreshonly,
      cwd => $directory;
  }
}
