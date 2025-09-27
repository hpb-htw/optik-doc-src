# Main Makefile
LATEX = -max_print_line=1024 lualatex
LATEX_OPT := -shell-escape -interaction=nonstopmode -synctex=1 --recorder

#bibtex
BIBTEX := biber
BIBTEX_OPT :=

WEB_REPO := optik-doc

MANUAL=optik.pdf

exclude := $(wildcard _*.tex)
tex := $(wildcard *.tex)
tex := $(filter-out $(exclude), $(tex))
chapters := $(wildcard chap/*.tex)
pdf := $(tex:.tex=.pdf)

tikz := $(wildcard tikz/*.tex)
tikz_pdf = $(tikz:.tex=.pdf)

asy := $(wildcard asy-img/*.asy)
asy_pdf = $(asy:.asy=.pdf)
asy_tex = $(asy:.asy=.tex)


all: $(pdf)


%.pdf: %.tex
	$(LATEX) $(LATEX_OPT) $<
	if [ -f $(<:.tex=.bcf) ]; then touch $(<); $(BIBTEX) $(BIBTEX_OPT) $(<:.tex=); fi
	$(LATEX) $(LATEX_OPT) $<
	$(LATEX) $(LATEX_OPT) $<
	latexmk -c $<

optik.tex: *.sty literatur.bib pygmentstyle.sty $(asy_tex) $(asy_pdf) $(chapters)
	touch $@

$(asy_pdf) $(asy_tex): $(asy)
	make -C asy-img


pygmentstyle.sty:
	pygmentize -S default -f latex -a full > $@

html: asy-img/optik/optik.asy
	doxygen doxygen.conf
	rsync -a --delete --progress tmp/html/ $(WEB_REPO) --exclude .git

deploy:
	make html
	make $(MANUAL)
	git -C $(WEB_REPO) add .
	git -C $(WEB_REPO) commit -a -m "Autocommit"
	git -C $(WEB_REPO) push --force origin main


clean:
	rm -fv *.aux *.out *.bbl *.blg *.pytxcode *.toc *.loe *.thm *.nav *.bcf *.tdo *.log *.run.xml *.snm *.vrb *.synctex.gz *.fls
	rm -fv chap/*.aux
	rm -rfv _minted-*
	

clean-latexmk:
	rm -rfv *.fdb_latexmk
	latexmk -C
	rm -rf latexmkrc

clean-target:
	rm -f *.pdf *.dvi
	rm -rf tmp

clean-all:
	rm pygmentstyle.sty
	make clean
	make clean-latexmk
	make clean-target	
	make -C asy-img clean-all
 
