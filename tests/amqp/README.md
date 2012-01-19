# AMQP testing for logstash

Unit tests are cute and fuzzy, but they aren't helpful when you need to do big end-to-end integration tests.

Mocking the AMQP library is not a reasonable solution, I need to know if it actually works, not if it theoretically works ;)

For this test, I use foreman to launch rabbitmq, two logstash agents, and a data generator.

The data goes:

Generator === TCP ==> logstash agent === AMQP ===> logstash agent ===> standard output

This allows me to test that both the amqp inputs and outputs of logstash work
with RabbitMQ. I hope to add more AMQP servers in the future.
