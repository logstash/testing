
dependencies: rabbitmq logstash

.PHONY: direct
direct: rabbitmq logstash
	cd $@; foreman start

.PHONY: fanout
fanout: rabbitmq logstash
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
