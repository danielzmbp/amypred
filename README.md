# amyampred
Snakemake pipeline to perform amyloid and antimicrobial prediction on a set of proteins in fasta format.
## Usage
Put the target files in samples and run:
`snakemake --use-conda -j <cores>`
## Requirements
- Snakemake
- [Ampep](https://github.com/tlawrence3/amPEPpy)
- [AmyloGram](https://github.com/michbur/AmyloGram)
- [AmpGram](https://github.com/michbur/AmpGram)
## References
- *Fernandez-Escamilla, A.-M., Rousseau, F., Schymkowitz, J. & Serrano, L. Prediction of sequence-dependent and mutational effects on the aggregation of peptides and proteins. Nat Biotechnol 22, 1302–1306 (2004).*
- *Família, C., Dennison, S. R., Quintas, A. & Phoenix, D. A. Prediction of Peptide and Protein Propensity for Amyloid Formation. Plos One 10, e0134679 (2015).*
- *Burdukiewicz, M. et al. Amyloidogenic motifs revealed by n-gram analysis. Sci Rep-uk 7, 12961 (2017).*
