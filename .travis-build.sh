#!/bin/bash Rscript

R --no-restore -e "knitr::knit2pdf('math_cheatsheet.rnw', quiet=TRUE)"
