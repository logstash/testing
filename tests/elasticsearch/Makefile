run: elasticsearch
	-mkdir elasticsearch
	foreman start

dependencies: logstash

clean:
	-rm -r elasticsearch/

.PHONY: logstash
logstash:
	$(MAKE) -C ../../build/logstash

.PHONY: elasticsearch
elasticsearch:
	$(MAKE) -C ../../build/elasticsearch
