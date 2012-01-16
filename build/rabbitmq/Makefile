VERSION=2.7.1
TARBALL=rabbitmq-server-generic-unix-$(VERSION).tar.gz
DIR=rabbitmq_server-$(VERSION)
BASEURL=http://www.rabbitmq.com/releases/rabbitmq-server/v$(VERSION)

default: extract

fetch: $(TARBALL)
extract: $(DIR) | fetch

distclean:
	-rm -f $(TARBALL)

$(TARBALL):
	wget $(BASEURL)/$@

$(DIR)/: $(TARBALL)
	tar -zxf $<
