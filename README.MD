# **SANVA - **S***taphylococcus* **A***ureus* **N**etwork-Based **V**ariant **A**nalysis 
##  This repository contains code to recreate the results from :
###  "Antibiotic Resistance Network Analysis Identifies RareMutations across Pathways"

#### Data must be in fastq paired format, and has to be copies in the SANVA-data folder.

## To run the code, clone this repository and run as this order:
 ####   - *sh installTools.sh* will intsll all tools you need for the analysis.
 ####   - *sh SAEVA.sh* will preprocess and analysis the raw sequence and prepered it for next analysis.
 ####   - *sh significantGenes.sh* will produce the significant genes based on nCOP network model

## SAEVA preprocessing step by step:
* #### In the first step, low-quality reads were trimmed using Trimmomatic 0.38 that trims the reads with length less than 100 and will cut the adapter in reads, if there is any.
* #### BWA-MEM 0.7.17 was used to align sequencing reads against the reference *S. aureus* .
* #### [NCTC 8325](https://www.ncbi.nlm.nih.gov/nuccore/NC_007795.1 ) complete genome. BWA-MEM is introduced to perform local alignment more accurate and faster than other BWA algorithms for high-quality queries. 
* #### Samtools 1.5 can transform the SAM file to a binary version of the same input (view `<-bt>` and `<flagstat>`parameters) and sort alignments by leftmost coordinates, or by read name (`<sort -o>` parameter). 
* #### Picard MarkDuplicate 2.9.0 can remove duplicate reads by locating and tag them in a BAM file, where duplicate reads are defined as originating from a single fragment of DNA.
* #### Freebayes 0.9.10 (with `<-f>` parameter that specifies reference FASTA file) was used to determine the sequence variants present in the samples. Freebayes generates a VCF file that includes all predicted variants (reference + observed allele) and a brief report on their quality scores. 
* #### VCFTools 4.1 (with vcffilter `<-f QUAL>` and `<DP>` parameters for filtering based on quality and depth, respectively) was used to filter the quality scores and depth of each read. Low quality and low depth (reads with quality and depth less than the average of reads) variants were removed. 
* #### We used BCFtools 1.8 to merge all variants in all isolates (view `<-Ob>` parameter was used to subset and filter VCF files by position and filtering expression, index parameter was created index file and merge `<--force>` was used to merge all variants in all samples in one file). 
* #### Variants were identified and analyzed using SpfEff 4.3, which predicts the effects of a variant using an interval forest approach. 
![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png)
