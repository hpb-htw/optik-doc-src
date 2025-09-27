# Asymptote Makefile
#exclude := $(wildcard _*.tex)
#tex := $(wildcard *.tex)
asy := $(wildcard *.asy)
libs := optik/optik.asy
asy := $(filter-out $(libs), $(asy))
pdf := $(asy:.asy=.pdf)
tex := $(asy:.asy=.tex)

ASY=python3 runasy.py
PYZ=python3 runpygment.py

tmp_ext := aux out log pre synctex.gz

all: $(pdf) $(tex)

%.pdf: %.asy
	$(ASY) $<

%.tex: %.asy
	$(PYZ) $<

$(asy): $(libs) shortcut.sty
	touch $@


clean:
	rm -fv *.ps *.tex

clean-html:
	rm -f *.html

clean-target:
	rm -f $(pdf) *.dvi *.ps
	$(MAKE) clean-html

clean-all:
	make clean
	make clean-target




