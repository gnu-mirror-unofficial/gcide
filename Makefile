PROJECT = gcide
VERSION = 0.51

DISTFILES=\
 $(wildcard CIDE.[A-Z])\
 COPYING\
 PRONUNC.JPG\
 PRONUNC.WEB\
 README.DIC\
 SYMBOLS.JPG\
 TAGSET.WEB\
 WEBFONT.ASC\
 WXXVII.JPG

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

