SOURCES = $(wildcard *.rnw)
PDFS = $(patsubst %.rnw, %.pdf, $(SOURCES))

SOURCES = $(wildcard *.rnw)
PDFS = $(patsubst %.rnw, %.pdf, $(SOURCES))

%.tex: %.rnw 
	Rscript -e "knitr::knit('$<', quiet=FALSE)"

%.pdf: %.tex
	latexmk -f -pdf -interaction=nonstopmode $<

all: $(PDFS)

clean:
	rm -fv *.aux *.log *.nav *.out *.snm *.toc *~ *.vrb *.bbl
