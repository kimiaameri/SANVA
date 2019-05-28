# **SANVA - **S***taphylococcus* **A***ureus* **N**etwork-Based **V**ariant **A**nalysis 
##  This repository contains code to recreate the results from :
###  "Antibiotic Resistance Network Analysis Identifies RareMutations across Pathways"


## To run the code, clone this repository and run as this order:
 ####   - *install.sh* will intsll all tools you need for the analysis.
 ####   - *SAEVA.sh* will preprocess and analysis the raw sequence and prepered it for next analysis.
 ####   - *significantGenes.sh* will produce the significant genes based on nCOP network model

### The nCOP model will find the minimal significant genes that appear in shortest pathways (heuristic evaluation) while they cover most of isolate
# Considering that the nCOP model is based on a heuristic evaluation
## The list of result genes might not be the same for each run
