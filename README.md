# RE-tools

##Introduction

This is a collection of scripts to process the output files of RepeatExplorer (RE). RE is a pipeline to analyse the repetitive genome content using low coverage high throughput sequencing data (Novák et al. 2010, Novák et al. 2013).

##Scripts

###Cluster graphs in R

**```pairshow.R```** is an R script for highlighting the position of read pairs in an RE cluster. It also indicates the position of reads which have no partner in that particular cluster ('Singlets'). ```pairshow.R``` works only if (1) RE was used on paired-end sequencing data and (2) RE was told to rename the reads. The names of mate reads must be equal except of their last character. Also, for this script to work, the library 'igraph' should not be loaded in R (which normally is not the case anyway). The 3D version requires a recent version of the package 'rgl' which can be installed typing ```install.packages('rgl', dependencies=T)```.

Usage: Open the script in an R editor and execute the whole code. You can then run ```pairshow2d()``` or ```pairshow3d()```. Either way, you will be prompted to select a file. Pick a GL file (such as found in the cluster folders).

```pairshow3d()``` takes three arguments, ```nodes```, ```lines```, and ```singlets``` which allow you toggle display of nodes, lines connecting mate pairs, and singlet highlighting, respectively. They are set ```T``` by default (displaying everything), but they can be swiched of if set to any other value. E.g. ```pairshow3d(lines=F)``` will plot nodes and highlight singlet but leave away lines connecting mate pairs.


###Creation of ```.ids``` files to import into SeqGrapheR

**```blastquery2ids.py```** generates a multiple ```.ids``` file from a TAB-separated BLAST output table (output format 6). It assumes one cluster's reads have been blasted against a database. That means, in the blast table, the read names appear in column 1 and the subjects in column 2.

Usage: ```python blastquery2ids.py <infile> <outfile>```

**```blastsub2ids.py```**, too,  generates a multiple ```.ids``` file from a TAB-separated BLAST output table (output format 6). However, it assumes a cluster's reads have served as the blast database. The script will look for read names in column 2 and for group names in column 1 of the blast table. This is useful when blasting short sequences against reads. It also stores the number of blast hits for each individual read. These information can accessed by clicking 'Tools' > 'Plot' > 'Frequency of Ids in selected list' in the SeqGrapheR main window. It is possible to specify multiple infiles. The output file will get the input file's names plus the extension 'ids'.

Usage: ```python blastsub2ids.py <infile> [<infile 2> ... <infile n>]```

**```RM2ids.py```** creates an .ids file from a RepeatMasker (RM) output file (extension .fas.out). This is useful to indicate the position of reads matching Repbase or a custom repeat database. RM output files are fixed width tables which makes them complicated to process in an automated manner. This script was tested on several files. However if it is failing on one of your RM output files please let me know and send a copy of the file.

Usage: ```python RM2ids.py <infile>```




##References

Novák, P., Neumann, P., & Macas, J. (2010). Graph-based clustering and characterization of repetitive sequences in next-generation sequencing data. BMC Bioinformatics, 11, 378. doi:10.1186/1471-2105-11-378

Novák, P., Neumann, P., Pech, J., Steinhaisl, J., & Macas, J. (2013). RepeatExplorer: a Galaxy-based web server for genome-wide characterization of eukaryotic repetitive elements from next-generation sequence reads. Bioinformatics, 29(6), 792–793. doi:10.1093/bioinformatics/btt054
