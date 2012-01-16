EPREFIX=$(HOME)/gentoo

.PHONY: bootstrap
bootstrap:
	$(MAKE) usr/portage
	$(MAKE) tmp/usr/bin/make
	$(MAKE) tmp/usr/bin/wget
	#./bootstrap-prefix.sh $EPREFIX/tmp sed
	#./bootstrap-prefix.sh $EPREFIX/tmp coreutils6
	#./bootstrap-prefix.sh $EPREFIX/tmp findutils5
	#./bootstrap-prefix.sh $EPREFIX/tmp tar22
	#./bootstrap-prefix.sh $EPREFIX/tmp patch
	#./bootstrap-prefix.sh $EPREFIX/tmp grep
	#./bootstrap-prefix.sh $EPREFIX/tmp gawk
	#./bootstrap-prefix.sh $EPREFIX/tmp bash
	#./bootstrap-prefix.sh $EPREFIX/tmp zlib
	#./bootstrap-prefix.sh $EPREFIX/tmp python
	#./bootstrap-prefix.sh $EPREFIX portage

bootstrap-prefix.sh:
	wget -O $@ http://overlays.gentoo.org/proj/alt/browser/trunk/prefix-overlay/scripts/bootstrap-prefix.sh?format=txt
	chmod 755 $@

bin/ etc/ sbin/ usr/ var/ usr/portage: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $(EPREFIX) tree

tmp/usr/bin/make: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $EPREFIX/tmp make

tmp/usr/bin/wget: | bootstrap-prefix.sh
	./bootstrap-prefix.sh $EPREFIX/tmp wget

