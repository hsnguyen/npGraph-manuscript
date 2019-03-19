FILENAME=paper

all: $(FILENAME).tex
	pdflatex $(FILENAME)
	pdflatex $(FILENAME)
#	pdflatex $(FILENAME)
	((unset BIBINPUTS ; bibtex $(FILENAME)) && pdflatex $(FILENAME)) || pdflatex $(FILENAME)
	pdflatex supplementary.tex
	pdflatex supplementary.tex
clean:
	rm -f $(FILENAME).ps $(FILENAME).xwm $(FILENAME).out *~ core *.aux *.log *.dvi *.toc *.bak *.lot *.lof *.bbl *.blg *.lol *.backup *gz

zip: clean
	tar zcvf $(FILENAME).tar.gz *
