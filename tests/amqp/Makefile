
dependencies: rabbitmq logstash

run:
	foreman start

clean:
	rm -r rabbitmq

.PHONY: rabbitmq
rabbitmq:
	$(MAKE) -C ../../build/rabbitmq

.PHONY: logstash
logstash:
	$(MAKE) -C ../../build/logstash
