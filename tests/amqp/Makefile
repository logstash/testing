
dependencies: rabbitmq logstash

run:
	foreman start

.PHONY: rabbitmq
rabbitmq:
	$(MAKE) -C ../../build/rabbitmq

.PHONY: logstash
logstash:
	$(MAKE) -C ../../build/logstash
