# Main Makefile
LATEX = -max_print_line=1024 lualatex
LATEX_OPT := -shell-escape -interaction=nonstopmode -synctex=1 --recorder

#bibtex
BIBTEX := biber
BIBTEX_OPT :=


exclude := $(wildcard _*.tex)
tex := $(wildcard *.tex)
tex := $(filter-out $(exclude), $(tex))
chapters := $(wildcard chap/*.tex)
pdf := $(tex:.tex=.pdf)

tikz := $(wildcard tikz/*.tex)
tikz_pdf = $(tikz:.tex=.pdf)

EXERCISES := exercises
TIKZ := tikz

#all: $(pdf) $(EXERCISES)
#	#make -C $(EXERCISES)

all: $(pdf)

interactive: skript.tex
	export max_print_line=1024; latexmk -pvc -view=none -pdflua -pdflualatex="lualatex $(LATEX_OPT) %O %S" $<

%.pdf: %.tex
	$(LATEX) $(LATEX_OPT) $<
	if [ -f $(<:.tex=.bcf) ]; then touch $(<); $(BIBTEX) $(BIBTEX_OPT) $(<:.tex=); fi
	$(LATEX) $(LATEX_OPT) $<
	$(LATEX) $(LATEX_OPT) $<
	latexmk -c $<

skript.tex: *.sty $(tikz_pdf) chap/*.tex
	touch $@

$(tikz_pdf): $(tikz)
	make -C $(TIKZ)

clean:
	rm -fv *.aux *.out *.bbl *.blg *.pytxcode *.toc *.loe *.thm *.nav *.bcf *.tdo *.log *.run.xml *.snm *.vrb *.synctex.gz *.fls
	rm -fv chap/*.aux
	rm -rfv _minted-*
	make -C $(EXERCISES) clean

clean-latexmk:
	rm -rfv *.fdb_latexmk
	latexmk -C
	rm -rf latexmkrc

clean-target:
	rm -f *.pdf *.dvi

clean-all:
	make clean
	make clean-latexmk
	make clean-target
	make -C $(EXERCISES) clean-all
	make -C $(TIKZ) clean-all
 
