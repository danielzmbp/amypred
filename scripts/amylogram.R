library(AmyloGram)
library(tidyverse)
library(parallel)

run_amylogram <- function(fasta){
  prediction <- predict(AmyloGram_model, fasta)
  return(prediction)
}

amylogram <- function(input,output){
  input_fasta <- read_txt(input)
  splitted_fasta <- split(input_fasta, 
    ceiling(seq_along(input_fasta)/20))
  ag <- mclapply(splitted_fasta, run_amylogram, mc.cores=snakemake@threads[[1]])
  ag1 <- map(ag, print)
  nested_lists <- tibble(name = map(ag1, "Name"),
    amylogram = map(ag1,"Probability"))

  ag2 <- unnest(nested_lists, cols = c(name,amylogram))

  ag2 %>% select(-name) %>%
    write_csv(output)
}

amylogram(snakemake@input[[1]], snakemake@output[[1]])
