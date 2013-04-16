stage {
  "upgrade": before => Stage["main"];
  #"apt-init": before => Stage["upgrade"];
}

class {
  "apt": purge_sources_list => true;
    #stage => "upgrade";
  "apt::upgrade": ; #stage => "upgrade";
  "os": ;
  "vagrant::guest": ;
  "logstash": 
    revision => $logstash_revision;
}

#Apt::Source {
  #stage => "upgrade"
#}

apt::source {
  "$lsbdistcodename":
    release => $lsbdistcodename,
    location => "http://mirror.math.ucdavis.edu/ubuntu/",
    repos => "main restricted universe multiverse";
  "$lsbdistcodename-updates":
    release => "$lsbdistcodename-updates",
    location => "http://mirror.math.ucdavis.edu/ubuntu/",
    repos => "main restricted universe multiverse";
  "$lsbdistcodename-backports":
    location => "http://mirror.math.ucdavis.edu/ubuntu/",
    release => "$lsbdistcodename-backports",
    repos => "main restricted universe multiverse";
  "$lsbdistcodename-security":
    location => "http://security.ubuntu.com/ubuntu",
    release => "$lsbdistcodename-security",
    repos => "main restricted universe multiverse";
}

$roles_list = split($roles, ",")

if member($roles_list, "redis") {
  class { "redis": ; }
}
