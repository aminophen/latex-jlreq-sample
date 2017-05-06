TARGET = ginga-1.pdf ginga-2.pdf
TARGETX = ginga-1-tombow.pdf ginga-2-tombow.pdf
KANJI = -kanji=utf8

tombow: $(TARGETX)
all: $(TARGET) $(TARGETX)

ginga-1-tombow.dvi: ginga-1.tex
	echo "\RequirePackage{filehook}" >platex.cfg
	echo "\AtEndOfClassFile{jlreq}{%" >>platex.cfg
	echo "  \RequirePackage{pxgentombow}%" >>platex.cfg
	echo "%  \RequirePackage{bounddvi}%" >>platex.cfg
	echo "}" >>platex.cfg
	uplatex $(KANJI) $<
	uplatex $(KANJI) $<
#	rm *.aux *.log
	mv $(patsubst %-tombow.dvi,%.dvi,$@) $@
ginga-2-tombow.dvi: ginga-2.tex
	echo "\RequirePackage{filehook}" >platex.cfg
	echo "\AtEndOfClassFile{jlreq}{%" >>platex.cfg
	echo "  \RequirePackage{pxgentombow}%" >>platex.cfg
	echo "%  \RequirePackage{bounddvi}%" >>platex.cfg
	echo "}" >>platex.cfg
	uplatex $(KANJI) $<
	uplatex $(KANJI) $<
#	rm *.aux *.log
	mv $(patsubst %-tombow.dvi,%.dvi,$@) $@

.SUFFIXES: .tex .dvi .pdf
.dvi.pdf:
	dvipdfmx $(FONTMAP) $<
.tex.dvi:
	echo "" >platex.cfg
	uplatex $(KANJI) $<
	uplatex $(KANJI) $<
#	rm *.aux *.log

.PHONY: clean cleanall
clean:
	rm -f *.dvi *-tombow.pdf *.aux *.log
cleanall:
	rm -f *.dvi *.pdf *.aux *.log
