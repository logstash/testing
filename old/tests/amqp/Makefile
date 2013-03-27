
dependencies: rabbitmq logstash

.PHONY: direct flood fanout topic
direct flood fanout topic: #rabbitmq logstash
	cd $@; foreman start

clean:
	-rm -r rabbitmq
	-rm -r */rabbitmq

.PHONY: rabbitmq
rabbitmq:
	$(MAKE) -C ../../build/rabbitmq

.PHONY: logstash
logstash:
	$(MAKE) -C ../../build/logstash
