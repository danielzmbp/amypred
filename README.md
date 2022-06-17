# amypred
Snakemake pipeline to perform amyloid prediction on a set of proteins in fasta format.
## Usage
Put the target files with the extension ".faa" in the folder samples and run:
`snakemake --use-conda -j <cores>`
## Requirements
- Snakemake
- [AmyloGram](https://github.com/michbur/AmyloGram)
- [APPNN](https://cran.r-project.org/web/packages/appnn/index.html)
## Output
The output is created in the results folder and consists of a ".csv" file where the rows are the proteins in the file and the columns the prediction scores.
## References
- *Fernandez-Escamilla, A.-M., Rousseau, F., Schymkowitz, J. & Serrano, L. Prediction of sequence-dependent and mutational effects on the aggregation of peptides and proteins. Nat Biotechnol 22, 1302–1306 (2004).*
- *Família, C., Dennison, S. R., Quintas, A. & Phoenix, D. A. Prediction of Peptide and Protein Propensity for Amyloid Formation. Plos One 10, e0134679 (2015).*
- *Burdukiewicz, M. et al. Amyloidogenic motifs revealed by n-gram analysis. Sci Rep-uk 7, 12961 (2017).*
