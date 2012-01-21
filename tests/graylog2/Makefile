run: mongodb graylog2
	foreman start

dependencies: graylog2 mongodb logstash

.PHONY: mongodb
mongodb:
	$(MAKE) -C ../../build/mongodb
	-mkdir mongodb

.PHONY: graylog2
graylog2:
	$(MAKE) -C ../../build/graylog2

.PHONY: logstash
logstash:
	$(MAKE) -C ../../build/logstash

.PHONY: elasticsearch
elasticsearch:
	$(MAKE) -C ../../build/elasticsearch
