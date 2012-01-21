clean:
	-find ./ -mindepth 2 -maxdepth 3 -name 'Makefile' \
	  | xargs -n1 sh -c 'cd $$(dirname $$1); $(MAKE) clean; $(MAKE) distclean' -
