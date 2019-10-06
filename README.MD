# **SANVA - **S***taphylococcus* **A***ureus* **N**etwork-Based **V**ariant **A**nalysis 
##  This repository contains code to recreate the results from :
###  "Antibiotic Resistance Network Analysis Identifies RareMutations across Pathways"

#### Data must be in fastq paired format, and has to be copies in the SANVA-data folder.

## To run the code, clone this repository and run as this order:
 ####   - *sh installTools.sh* will intsll all tools you need for the analysis.
 ####   - *sh SAEVA.sh* will preprocess and analysis the raw sequence and prepered it for next analysis.
 ####   - *sh significantGenes.sh* will produce the significant genes based on nCOP network model

## SANVA Pipeline step by step:

![SANVA Pipeline](https://github.com/kimiaameri/SANVA/blob/master/pipeline.jp2)

#### for more detail information please check the wiki:
[SANVA wiki ](https://github.com/kimiaameri/SANVA/wiki/preprocessing) 
