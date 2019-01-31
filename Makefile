SOURCES = $(wildcard *.rnw)
PDFS = $(patsubst %.rnw, %.pdf, $(SOURCES))

%.pdf: %.rnw %.R
	Rscript -e "knitr::knit2pdf('$<', quiet=TRUE)"

all: $(PDFS)

clean:
	rm -fv *.aux *.log *.nav *.out *.snm *.toc *~ *.tex *.vrb
