# **SANVA - **S***taphylococcus* **A***ureus* **N**etwork-Based **V**ariant **A**nalysis 
##  This repository contains code to recreate the results from paper:
###  "Network Analysis of Antibiotic Resistance Identifies Compelling Mutations across Pathways"

#### Data must be in fastq paired format, and has to be copies in the SANVA-data folder.

## To run the code, clone this repository and run as this order:

 #### 
 ```bash
  sh installTools.sh
  ```
  - will intsll all tools you need for the analysis. All the tools we used are in the anaconda sanva package which you can activate as:
  ```bash
  conda env create -f sanva.environment.yaml
conda activate
conda activate sanva
```
-----------------------------------------------------------------
 #### 
 ```bash
 sh SAEVA.sh
 ```
 - will preprocess and analysis the raw sequence and prepered it for next analysis.
 ####  
 
 ```bash
 sh significantGenes.sh
 ```
 - will produce the significant genes based on nCOP network model

## SANVA Pipeline step by step:

![SANVA Pipeline](https://github.com/kimiaameri/SANVA/blob/master/pipeline.jp2)
###### Overview of our workflow. Part(I): Pre-processing and variant analysis of the whole genome sequences. Fasta files were downloaded from NCBI. Table(A) contains the normalized weight for each gene that has a mutation in at least one of the isolates. The normal weight here is the frequency of mutation per gene length. The gene IDs from the table (A) are used to make the protein-protein interaction network. Table (B) shows the required input file for the nCop model. It contains a list of isolates that have a mutation in each gene. The String V.11 was used to build the PPI network for mutated genes, based on experiments with low confidence (0.15) in order to have the possible physical interactions in the PPI network. Part(II): Using Network-Based Coverage of Mutational Profiles (nCop) Model. Network B was made by aggregating network C and isolates that mutated in each gene (table(B)). The nCop model will find the shortest paths that cover the highest number of isolates. Network(C) shows the minimum number of genes that cover most of the isolates. Table (C) rank the genes from the network (C) according to the percentage of their appearance in subnetworks.

#### for more detail information please check the wiki:
[SANVA wiki ](https://github.com/kimiaameri/SANVA/wiki/preprocessing) 
