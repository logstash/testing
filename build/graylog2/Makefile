VERSION=0.9.6
SERVER_TARBALL=graylog2-server-$(VERSION).tar.gz
SERVER_DIR=graylog2-server-$(VERSION)
WEB_TARBALL=graylog2-web-interface-$(VERSION).tar.gz
WEB_DIR=graylog2-web-interface-$(VERSION)
BASEURL=https://github.com/downloads/Graylog2

fetch: $(WEB_TARBALL) $(SERVER_TARBALL)

extract: $(SERVER_DIR)/

distclean:
	-rm -f $(WEB_TARBALL) $(SERVER_TARBALL)

$(WEB_TARBALL):
	wget $(BASEURL)/graylog2-web-interface/$@

$(SERVER_TARBALL):
	wget $(BASEURL)/graylog2-server/$@

$(SERVER_DIR): $(SERVER_TARBALL)
	tar -zxf $<
