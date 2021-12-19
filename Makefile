SOURCES = math_cheatsheet.rnw
PDFS = $(patsubst %.rnw, %.pdf, $(SOURCES))

# rsync arguments
RSYNC = rsync -rlptoDvuK --delete
OVID = $(HOME)/www/ovid

%.tex: %.rnw 
	Rscript -e "knitr::knit('$<', quiet=FALSE)"

%.pdf: %.tex
	latexmk -f -pdf -interaction=nonstopmode $<

all: $(PDFS)

# publish the pdf on ovid: faculty.washington.edu/otoomet/
# first copy to $HOME/www/ovid, thereafter the whole ovid to the ovid server
publish:
	$(RSYNC) math_cheatsheed.pdf $(OVID)/ && \
	$(RSYNC) $(HOME)/www/ovid/ ovid:public_html/

clean:
	rm -fv *.aux *.log *.nav *.out *.snm *.toc *~ *.vrb *.bbl
