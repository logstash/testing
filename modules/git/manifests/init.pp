class git {
  package {
    "git": ensure => latest;
    "git-core": ensure => latest;
  }

  Vcsrepo <| |> {
    require +> Package["git", "git-core"]
  }
}
