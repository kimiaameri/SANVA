#!/bin/sh
#SBATCH --time=80:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=16384     # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=SAVEA
#SBATCH --error=SAVEA.%J.err
#SBATCH --output=SAVEA.%J.out
cd $WORK/SANVA-outputs/
mkdir vcfbed
mkdir intersection
conda activate ~/miniconda3
cd $WORK/SANVA/
python3 GenomeBedPull.py $WORK/SANVA_reference_genome 
export GENOME_BED_PATH="$WORK/SANVA_reference_genome/"
python3 pythonVcfbed.py ./InputFiles.csv $MINICONDA_HOME
sh vcfBed.sh
python3 pythonIntersections.py ./InputFiles.csv $GENOME_BED_PATH
sh mapVCF-to-Bed.sh

export INTERSECTIONS_PATH="$WORK/SANVA-outputs/intersection/"
export OUTPUT_PATH="$WORK/SANVA-outputs/"


cd $WORK/SANVA-outputs
export SOURCE_DIR="$WORK/SANVA"

cd $WORK/SANVA_reference_genome
cat  nctc8325.bed | tail -n+2 > nctc8325-1.bed 
cd $WORK/SANVA/     
Rscript maincode.R $SOURCE_DIR $GENOME_BED_PATH $INTERSECTIONS_PATH ./InputFiles.csv bigtable.csv tableWeight.csv 
mv bigtable.csv $OUTPUT_PATH/

Rscript String-Prepration.R $SOURCE_DIR $OUTPUT_PATH/bigtable.csv $OUTPUT_PATH/GenesList.csv $OUTPUT_PATH/GenesList.txt

Python3 stringMapping.py $OUTPUT_PATH/GenesList.txt $OUTPUT_PATH/string_mapping.tsv
Python3 STRINGNetworkInteractions.py $OUTPUT_PATH/GenesList.txt $OUTPUT_PATH/string_interactions.tsv

Rscript String-Prepration.R $OUTPUT_PATH/bigtable.csv $OUTPUT_PATH/string_interactions.tsv $OUTPUT_PATH/string_mapping.tsv $OUTPUT_PATH/PPI.txt $OUTPUT_PATH/mutational.txt $OUTPUT_PATH/weights.txt             

