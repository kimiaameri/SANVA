# **SANVA - **S***taphylococcus* **A***ureus* **N**etwork-Based **V**ariant **A**nalysis 
##  This repository contains code to recreate the results from :
###  "Antibiotic Resistance Network Analysis Identifies RareMutations across Pathways"

#### Data must be in fastq format. and has to be copies in the SANVA-data folder.
#### You need to make a CSV file from the input raw data as the format bellow:
##### File name has to be "InputFiles.CSV"
##### The CSV file must have header as: Name, Forward reads, Reverse Reads, Type
##### An example for the InputFiles.CSV content is:
##### SRR5226318,SRR5226318_1.fastq,SRR5226318_2.fastq,E2

## To run the code, clone this repository and run as this order:
 ####   - *install.sh* will intsll all tools you need for the analysis.
 ####   - *SAEVA.sh* will preprocess and analysis the raw sequence and prepered it for next analysis.
 ####   - *significantGenes.sh* will produce the significant genes based on nCOP network model

