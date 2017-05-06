KANJI = -kanji=utf8

all: ginga-1-tombow.pdf ginga-2-tombow.pdf

ginga-1-tombow.dvi: ginga-1.tex
	uplatex $(KANJI) $<
	uplatex $(KANJI) $<
#	rm *.aux *.log
	mv $(patsubst %-tombow.dvi,%.dvi,$@) $@
ginga-2-tombow.dvi: ginga-2.tex
	uplatex $(KANJI) $<
	uplatex $(KANJI) $<
#	rm *.aux *.log
	mv $(patsubst %-tombow.dvi,%.dvi,$@) $@

.SUFFIXES: .dvi .pdf
.dvi.pdf:
	dvipdfmx $(FONTMAP) $<

.PHONY: clean
clean:
	rm -f *.dvi *.pdf *.aux *.log
