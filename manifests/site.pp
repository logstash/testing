stage {
  "upgrade": before => Stage["main"];
}

class {
  "apt::upgrade": stage => "upgrade";
  "os": ;
  "vagrant::guest": ;
  "logstash": 
    revision => $logstash_revision;
}

$roles_list = split($roles, ",")

if member($roles_list, "redis") {
  class { "redis": ; }
}
