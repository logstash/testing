VERSION=0.18.7
TARBALL=elasticsearch-$(VERSION).tar.gz
DIR=elasticsearch-$(VERSION)
BASEURL=https://github.com/downloads/elasticsearch/elasticsearch

default: extract

fetch: $(TARBALL)

extract: $(DIR)/

distclean:
	-rm -f $(TARBALL)

$(TARBALL):
	wget $(BASEURL)/$(TARBALL)

$(DIR): $(TARBALL)
	tar -zxf $<
