stage {
  "you will be upgraded": before => Stage["main"];
}

class {
  "apt::update": stage => "you will be upgraded";
  "apt::upgrade": stage => "you will be upgraded";
}

class {
  "os": ;
  "vagrant::guest": ;
  "logstash":
    revision => $logstash_revision;
}

$roles_list = split($roles, ",")

if member($roles_list, "redis") {
  include redis
}
