class user::tools {
  package {
    "build-essential": ensure => latest;
    "clang": ensure => latest;
    "cscope": ensure => latest;
    "exuberant-ctags": ensure => latest;
    "vim": ensure => latest;
    "gcc": ensure => latest;
    "g++": ensure => latest;
    "gdb": ensure => latest;
    "git": ensure => latest;
    "libtool": ensure => latest;
    "libltdl7": ensure => latest;
    "libltdl-dev": ensure => latest;
    "lsof": ensure => latest;
    "nmap": ensure => latest;
    "libssl-dev": ensure => latest;
    "strace": ensure => latest;
    "valgrind": ensure => latest;
    "zsh": ensure => latest;
    "libyaml-dev": ensure => latest;

    "libxml2": ensure => latest;
    "libxml2-dev": ensure => latest;
    "libxslt1.1": ensure => latest;
    "libxslt1-dev": ensure => latest;

    "ragel": ensure => latest;

    "libreadline6": ensure => latest;
    "readline-common": ensure => latest;
    "libreadline-dev": ensure => latest;

    "ant1.7": ensure => latest;
  }
}
