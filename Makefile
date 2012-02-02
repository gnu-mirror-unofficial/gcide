PROJECT = gcide
VERSION = 0.51

DISTFILES=\
 $(wildcard CIDE.[A-Z])\
 COPYING\
 README\
 pronunc.jpg\
 symbols.jpg\
 pronunc.txt\
 tagset.txt\
 webfont.txt\
 abbrevn.lst\
 authors.lst\
 titlepage.png 

anclist:
	@ls -o $(DISTFILES) | grep -v 'CIDE.[A-Z]'

clean:
	rm -f *~

distclean: clean
	rm -f $(DISTBASE).tar.gz $(DISTBASE).tar.xz $(DISTBASE).zip

DISTBASE = $(PROJECT)-$(VERSION)

distdir:
	rm -rf $(DISTBASE)	
	mkdir $(DISTBASE)
	cp $(DISTFILES) $(DISTBASE)

dist: distdir
	GZIP=--best tar -Hustar -czf $(DISTBASE).tar.gz $(DISTBASE)
	tar -Hustar -cJf $(DISTBASE).tar.xz $(DISTBASE)
	rm -f $(DISTBASE).zip; zip -9 -r $(DISTBASE).zip $(DISTBASE)
	rm -rf $(DISTBASE)

