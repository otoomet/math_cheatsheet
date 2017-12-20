SOURCES = $(wildcard *.rnw)
SLIDES = $(patsubst %.rnw, %.pdf, $(SOURCES))

%.pdf: %.rnw
	Rscript -e "knitr::knit2pdf('$<', quiet=TRUE)"

all: $(SLIDES)

clean:
	rm -fv *.aux *.log *.nav *.out *.snm *.toc *~ *.tex *.vrb
