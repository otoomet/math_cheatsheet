#!/bin/bash Rscript

Rscript -e "knitr::knit2pdf('math_cheatsheet.rnw', quiet=TRUE)"
