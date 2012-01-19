VERSION?=master
DIR=logstash-$(VERSION)
TARBALL=logstash-$(VERSION).tar.gz

default: build

fetch: $(TARBALL)
extract: $(DIR)/ | fetch

build: | extract
	cd $(DIR); make jar

clean:
	-rm -rf logstash-$(VERSION)

distclean:
	-rm -f $(TARBALL)

$(TARBALL):
	wget -O $(TARBALL) https://github.com/logstash/logstash/tarball/$(VERSION)

$(DIR)/: $(TARBALL)
	-mkdir $(DIR)
	tar --strip-components=1 -C $(DIR) -zxf $<
