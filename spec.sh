. ./lib.rc
quiet vagrant up
vagrant ssh <<SCRIPT
`cat ./lib.rc`
cd /app/logstash/logstash || exit 1
quiet sudo -u logstash make vendor/bundle || exit 1
exec sudo -u logstash env USE_JRUBY=1 bin/logstash rspec $*
SCRIPT
