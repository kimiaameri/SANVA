#!/bin/sh
#SBATCH --time=80:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=16384     # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=SAVEA
#SBATCH --error=SAVEA.%J.err
#SBATCH --output=SAVEA.%J.out
cd $WORK/SANVA-outputs/
mkdir vcfbed
mkdir intersection
cd $WORK/SANVA/
python3 GenomeBedPull.py $WORK/SANVA_reference_genome 
export GENOME_BED_PATH="$WORK/SANVA_reference_genome/"
python3 pythonVcfbed.py ./InputFiles.csv $MINICONDA_HOME
sh vcfBed.sh
python3 pythonIntersections.py ./InputFiles.csv $GENOME_BED_PATH $MINICONDA_HOME
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

Rscript StringPrepration.R $SOURCE_DIR $OUTPUT_PATH/bigtable.csv $OUTPUT_PATH/GenesList.csv $OUTPUT_PATH/GenesList.txt

python3 stringMapping.py $OUTPUT_PATH/GenesList.txt $OUTPUT_PATH/string_mapping.tsv
python3 STRINGNetworkInteractions.py $OUTPUT_PATH/GenesList.txt $OUTPUT_PATH/string_interactions.tsv

Rscript nCOPprepration.R $OUTPUT_PATH/bigtable.csv $OUTPUT_PATH/string_interactions.tsv $OUTPUT_PATH/string_mapping.tsv $SOURCE_DIR/nCOP/PPI.txt $SOURCE_DIR/nCOP/mutational.txt $SOURCE_DIR/nCOP/weights.txt             
#-----------------------------------nCOP
cd $WORK/SANVA
git clone https://github.com/Singh-Lab/nCOP.git
#---------nCOP
#module load ruby/1.2
cd $WORK/SANVA/nCOP
mkdir Outputs
./run_nCOP PPI.txt mutational.txt weights=weights.txt 
cd ../
Rscript output_prepration.R $SOURCE_DIR/nCOP/Outputs/nCOP_out_results.txt $SOURCE_DIR/nCOP/mutational.txt $OUTPUT_PATH/FinalTable.csv $OUTPUT_PATH/bigtable.csv $OUTPUT_PATH/heatMap.pdf $OUTPUT_PATH/ggplot.pdf

