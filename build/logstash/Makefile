DIR=logstash

default: build

build: | $(DIR)/
	cd $(DIR); git pull --rebase; make jar

clean:
	-rm -rf $(DIR)

$(DIR)/:
	git clone https://github.com/logstash/logstash.git
