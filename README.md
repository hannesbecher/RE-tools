# RE-tools


This is a collection of scripts to process the output files of RepeatExplorer (RE). RE is a pipeline to analyse the repetitive genome content using low coverage high throughput sequencing data (Novák et al. 2010, Novak et al. 2013)

## Files

###ready to test

**blastquery2ids.py** generates a multiple .ids file from a TAB-separated BLAST output table (output format 6). It assumes one cluster's reads have been blasted against a database. That means, in the blast table, the read names appear in column 1 and the subjects in column 2.

Usage: python blastquery2ids.py \<infile\> \<outfile\>

**blastsub2ids.py**, too,  generates a multiple .ids file from a TAB-separated BLAST output table (output format 6). However, it assumes a cluster's reads have served as the blast database. The script will look for read names in column 2 and for group names in column 1 of the blast table. This is useful when blasting short sequences against reads. It also stores the number of blast hits for each individual read. These information can accessed by clicking 'Tools' > 'Plot' > 'Frequency of Ids in selected list' in the SeqGrapheR main window. It is possible to specify multiple infiles. The output file will get the input file's names plus the extension 'ids'.

Usage: python blastsub2ids.py \<infile\> [\<infile 2\> ... \<infile n\>]


###coming soon...

**custom2ids.py** creates an .ids file from a RepeatMasker output file. This is useful to indicate the position of reads matching a custom repeat database.

**matepair.R** is an R script to highlight the position of read pairs in a RE cluster. It also indicates the position of reads who have no partner in one particular cluster. I requires the R library 'igraph' to be installed. **maitepair.R** works only if (1) RE was used on paired end sequencing data and (2) RE was told to rename the reads. The names of mate reads must be equal except of their last character which must be 'l' and 'r'.



##References

Novák, P., Neumann, P., & Macas, J. (2010). Graph-based clustering and characterization of repetitive sequences in next-generation sequencing data. BMC Bioinformatics, 11, 378. doi:10.1186/1471-2105-11-378

Novák, P., Neumann, P., Pech, J., Steinhaisl, J., & Macas, J. (2013). RepeatExplorer: a Galaxy-based web server for genome-wide characterization of eukaryotic repetitive elements from next-generation sequence reads. Bioinformatics, 29(6), 792–793. doi:10.1093/bioinformatics/btt054