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
- *Burdukiewicz, M. et al. Proteomic Screening for Prediction and Design of Antimicrobial Peptides with AmpGram. Int J Mol Sci 21, 4310 (2020).*
- *Lawrence, T. J. et al. amPEPpy 1.0: A portable and accurate antimicrobial peptide prediction tool. Bioinformatics btaa917- (2020) doi:10.1093/bioinformatics/btaa917.*
- *Daniel Veltri, Uday Kamath, Amarda Shehu, Deep learning improves antimicrobial peptide recognition, Bioinformatics, Volume 34, Issue 16, 15 August 2018, Pages 2740–2747, https://doi.org/10.1093/bioinformatics/bty179*