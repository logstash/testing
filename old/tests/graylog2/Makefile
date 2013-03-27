run: mongodb graylog2
	-mkdir mongodb graylog2 elasticsearch
	foreman start

dependencies: graylog2 mongodb logstash

clean:
	rm -r graylog2/ mongodb/ elasticsearch/

.PHONY: mongodb
mongodb:
	$(MAKE) -C ../../build/mongodb

.PHONY: graylog2
graylog2:
	$(MAKE) -C ../../build/graylog2

.PHONY: logstash
logstash:
	$(MAKE) -C ../../build/logstash

.PHONY: elasticsearch
elasticsearch:
	$(MAKE) -C ../../build/elasticsearch
