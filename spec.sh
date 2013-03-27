. ./lib.rc
export FACTER_roles=redis
note "==> Getting a VM"
quiet vagrant up --no-provision
note "==> Provisioning..."
quiet vagrant provision
vagrant ssh <<SCRIPT
`cat ./lib.rc`
cd /app/logstash/logstash || exit 1
note "==> Preparing logstash"
quiet sudo -u logstash make vendor/bundle || exit 1
note "==> Running tests: $*"
exec sudo -u logstash env USE_JRUBY=1 bin/logstash rspec $*
SCRIPT
