set -e
vagrant up
vagrant ssh <<SCRIPT
set -e
cd /app/logstash/logstash
sudo -u logstash make vendor/bundle
sudo -u logstash bin/logstash rspec $*
SCRIPT
