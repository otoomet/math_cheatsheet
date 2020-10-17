#!/bin/bash

Rscript -e "install.packages(c('knitr', 'ggplot2', 'dplyr', 'gridExtra'), Ncpus = "$(nproc)")"

make

lscpu
