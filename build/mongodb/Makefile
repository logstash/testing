VERSION=2.0.2
TARBALL=mongodb-src-r$(VERSION).tar.gz
DIR=mongodb-src-r$(VERSION)
BASEURL=http://downloads.mongodb.org/src

fetch: $(TARBALL)

extract: $(DIR)/

distclean:
	-rm -f $(TARBALL)

$(TARBALL):
	wget $(BASEURL)/$@

$(DIR)/: $(TARBALL)
	tar -zxf $<
