# This is a transcription of the installation instructions for Gentoo Prefix
# from here: http://www.gentoo.org/proj/en/gentoo-alt/prefix/bootstrap-solaris.xml
# (The Solaris docs are relevant to Linux as well)
#
# This file aims to be an idempotent one-shot way of getting gentoo prefix setup.

# Where should we install? You can pass this in the command line:
#   % make bootstrap EPREFIX=path/to/location
EPREFIX?=$(HOME)/gentoo


# Don't change things below here unless you know what you're doing :)
VPATH=$(EPREFIX)
PATH=tmp/usr/bin:usr/bin:$(shell echo $$PATH)

.PHONY: bootstrap-portage
bootstrap-portage:
	$(MAKE) usr/portage
	$(MAKE) tmp/usr/bin/make
	$(MAKE) tmp/usr/bin/wget
	$(MAKE) tmp/usr/bin/sed
	$(MAKE) coreutils
	$(MAKE) findutils
	$(MAKE) tmp/usr/bin/tar
	$(MAKE) tmp/usr/bin/patch
	$(MAKE) tmp/usr/bin/grep
	$(MAKE) tmp/usr/bin/gawk
	$(MAKE) tmp/usr/bin/bash
	$(MAKE) tmp/usr/lib/libz.so.1
	$(MAKE) tmp/usr/bin/python
	$(MAKE) usr/bin/emerge

.PHONY: emerge-basics 
emerge-basics: | bootstrap-portage
	emerge --oneshot sed
	#emerge --oneshot --nodeps bash
	#emerge --oneshot --nodeps sys-apps/baselayout-prefix
	#emerge --oneshot --nodeps app-arch/xz-utils
	#emerge --oneshot --nodeps sys-devel/m4
	#emerge --oneshot --nodeps sys-devel/flex
	#emerge --oneshot --nodeps sys-devel/bison
	#emerge --oneshot --nodeps sys-devel/binutils-config
	#emerge --oneshot --nodeps sys-devel/binutils
	#emerge --oneshot --nodeps sys-devel/gcc-config
	#emerge --oneshot --nodeps "=sys-devel/gcc-4.2*"
	#emerge --oneshot sys-apps/coreutils
	#emerge --oneshot sys-apps/findutils
	#emerge --oneshot app-arch/tar
	#emerge --oneshot sys-apps/grep
	#emerge --oneshot sys-devel/patch
	#emerge --oneshot sys-apps/gawk
	#emerge --oneshot sys-devel/make
	#emerge --oneshot sys-libs/zlib
	#emerge --oneshot --nodeps sys-apps/file
	#emerge --oneshot --nodeps app-admin/eselect
	#emerge --oneshot app-misc/pax-utils
	#emerge --oneshot "<net-misc/wget-1.13.4-r1" (until we fix #393277)
	#env FEATURES="-collision-protect" emerge --oneshot sys-apps/portage

.PHONY: clean-bootstrap
clean-bootstrap:
	! [ -z "$(EPREFIX)" ] 
	rm -rf $(EPREFIX)/tmp/*

bootstrap-prefix.sh:
	wget -O $@ http://overlays.gentoo.org/proj/alt/browser/trunk/prefix-overlay/scripts/bootstrap-prefix.sh?format=txt
	chmod 755 $@

bin/ etc/ sbin/ usr/ var/ usr/portage: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX) tree

tmp/usr/bin/make: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX)/tmp make

tmp/usr/bin/wget: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX)/tmp wget

tmp/usr/bin/sed: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX)/tmp sed

# coreutils provides more than just basename, but this is just a check.
.PHONY: coreutils
coreutils: tmp/usr/bin/basename
tmp/usr/bin/basename: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX)/tmp coreutils6

# findutils provides more than just 'find', but this is just a check.
.PHONY: findutils
findutils: tmp/usr/bin/find
tmp/usr/bin/find: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX)/tmp coreutils6

tmp/usr/bin/tar: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX)/tmp tar22

tmp/usr/bin/patch: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX)/tmp patch

tmp/usr/bin/grep: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX)/tmp grep

tmp/usr/bin/gawk: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX)/tmp gawk

tmp/usr/bin/bash: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX)/tmp bash

tmp/usr/lib/libz.so.1: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX)/tmp zlib

tmp/usr/bin/python: | bootstrap-prefix.sh 
	./bootstrap-prefix.sh $(EPREFIX)/tmp python

usr/bin/emerge: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX) portage
