# Title     : appnn
# Objective : script written to be used as a snakemake rule. Takes as input a fasta
# seq and writes the appnn amyloid prediction as a csv file in the output
# Created by: danielgomezperez
# Created on: 29.03.21

library(appnn)
library(tidyverse)

fasta <- seqinr::read.fasta(snakemake@input[[1]], 
  seqtype = "AA", seqonly = TRUE)

results <- vector()

# run only those that don't contain X
# as this will throw an error

for (i in 1:length(fasta)){
        if(grepl("X",fasta[i])==FALSE){
            t <- appnn(fasta[i])
            results[i] <- t[1][[1]]$overall
    }}

ap <- tibble(results)

ap %>% rename(appnn = results) %>%
  write_csv(snakemake@output[[1]])
