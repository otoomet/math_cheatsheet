SOURCES = $(wildcard *.rnw)
PDFS = $(patsubst %.rnw, %.pdf, $(SOURCES))

match_cheatsheet.pdf: math_cheatsheet.rnw
	Rscript -e "knitr::knit2pdf('$<', quiet=TRUE)"

%.pdf: %.rnw %.R
	Rscript -e "knitr::knit2pdf('$<', quiet=TRUE)"

all: $(PDFS)

clean:
	rm -fv *.aux *.log *.nav *.out *.snm *.toc *~ *.tex *.vrb
