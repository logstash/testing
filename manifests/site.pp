include os
include apt::update
include logstash

$roles_list = split($roles, ",")

if member($roles_list, "redis") {
  include redis
}
