VERSION=2.0.2
TARBALL=mongodb-src-r$(VERSION).tar.gz
DIR=mongodb-src-r$(VERSION)
BASEURL=http://downloads.mongodb.org/src

default: build

fetch: $(TARBALL)
extract: $(DIR)/ | fetch

build: mongodb-src-r$(VERSION)/mongod

mongodb-src-r$(VERSION)/mongod: | extract
	cd $(DIR); scons --cpppath ~/gentoo/usr/include --libpath ~/gentoo/usr/lib all

distclean:
	-rm -f $(TARBALL)

$(TARBALL):
	wget $(BASEURL)/$@

$(DIR)/: $(TARBALL)
	tar -zxf $<
