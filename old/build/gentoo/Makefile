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
PATH=$(EPREFIX)/usr/bin:$(EPREFIX)/tmp/usr/bin:$(shell echo $$PATH)

default: emerge-basics

clean:
	rm bootstrap-prefix.sh

# The make invocations below could just be listed as dependencies, but since I
# don't know the full dependency tree of gentoo prefix (just the list, not the
# tree), I can't specify dependencies as normal make targets in the event that
# someone tries to do 'make -J<N>'.
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
	# Disable stripping because the bootstrap doesn't come with 'scanelf'
	# Also because I don't want to strip binaries anyway, makes them harder to
	# debug.
	sed -i -e 's,FEATURES=.*,FEATURES="$${FEATURES} -news nostrip",' $(EPREFIX)/etc/make.profile/make.defaults
	echo "PATH=$(EPREFIX)/usr/bin:$(EPREFIX)/bin" > $(EPREFIX)/profile.rc
	$(MAKE) bin/sed
	$(MAKE) bin/bash
	$(MAKE) etc/gentoo-release # sys-apps/baselayout-prefix
	$(MAKE) usr/bin/xz
	$(MAKE) usr/bin/m4
	$(MAKE) usr/bin/flex
	$(MAKE) usr/bin/bison
	$(MAKE) usr/bin/binutils-config # sys-devel/binutils-config
	$(MAKE) usr/bin/gcc-config
	$(MAKE) usr/bin/gcc-4.2.4
	$(MAKE) usr/bin/env
	$(MAKE) usr/bin/find
	$(MAKE) usr/bin/gawk
	$(MAKE) usr/bin/make
	$(MAKE) lib/libz.so.1 # sys-libs/zlib
	$(MAKE) usr/bin/file
	$(MAKE) usr/bin/eselect
	$(MAKE) usr/bin/scanelf # app-misc/pax-utils
	$(MAKE) usr/bin/wget
	if [ ! -e $(EPREFIX)/var/db/pkg/sys-apps/portage* ] ; then \
		env FEATURES="-collision-protect" emerge --oneshot sys-apps/portage; \
	fi
	emerge --sync
	@echo "All done!"
	@echo "You may want to run: USE=-git emerge -u system"
	@echo "And then: emerge -e system"

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
	./bootstrap-prefix.sh $(EPREFIX)/tmp findutils

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

## All the --oneshot stuff
bin/sed:
	emerge --oneshot sed

#bin/bash: #usr/bin/bison usr/bin/flex
bin/bash: 
	emerge --oneshot --nodeps bash

usr/bin/bison: usr/bin/flex
	# Can't install bash without bison, bison is flagged bad because /bin/sh doesn't exist.
	# Hack it by symlinking for now.
	if [ ! -e $(EPREFIX)/bin/sh ] ; then \
		ln -s /bin/sh $(EPREFIX)/bin/sh; \
		emerge --oneshot --nodeps sys-devel/bison; \
		rm $(EPREFIX)/bin/sh; \
	else \
		emerge --oneshot --nodeps sys-devel/bison; \
	fi

etc/gentoo-release:
	emerge --oneshot --nodeps sys-apps/baselayout-prefix

usr/bin/xz:
	emerge --oneshot --nodeps app-arch/xz-utils

usr/bin/m4:
	emerge --oneshot --nodeps sys-devel/m4

usr/bin/flex:
	emerge --oneshot --nodeps sys-devel/flex

usr/bin/binutils-config:
	# Use 2.21 because 2.22 fails to build due to a patch failure.
	emerge --oneshot --nodeps "=sys-devel/binutils-config-2.21*"

etc/env.d/binutils:
	emerge --oneshot --nodeps "=sys-devel/binutils-2.21*"

usr/bin/gcc-config:
	emerge --oneshot --nodeps sys-devel/gcc-config

usr/bin/gcc-4.2.4:
	emerge --oneshot --nodeps "=sys-devel/gcc-4.2.4*"

usr/bin/env:
	emerge --oneshot sys-apps/coreutils

usr/bin/find:
	emerge --oneshot sys-apps/findutils

usr/bin/tar:
	emerge --oneshot app-arch/tar

usr/bin/grep:
	emerge --oneshot sys-apps/grep

usr/bin/patch:
	emerge --oneshot sys-devel/patch

usr/bin/gawk:
	emerge --oneshot sys-apps/gawk

usr/bin/make:
	emerge --oneshot sys-devel/make

lib/libz.so.1:
	emerge --oneshot sys-libs/zlib

usr/bin/file:
	emerge --oneshot --nodeps sys-apps/file

usr/bin/eselect:
	emerge --oneshot --nodeps app-admin/eselect

usr/bin/scanelf:
	emerge --oneshot app-misc/pax-utils

usr/bin/wget:
	emerge --oneshot "<net-misc/wget-1.13.4-r1" # (until we fix #393277)
