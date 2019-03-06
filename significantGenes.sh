cd $WORK/SAEVA-outputs/
mkdir vcfbed
mkdir intersection

cd $WORK/SAEVA/
python3 GenomeBedPull.py $WORK/SAEVA_reference_genome 
export GENOME_BED_PATH="$WORK/SAEVA_reference_genome/"
python3 pythonVcfbed.py ../InputFiles.csv $MINICONDA_HOME
sh vcfBed.sh
python3 pythonIntersections.py ../InputFiles.csv $GENOME_BED_PATH
sh mapVCF-to-Bed.sh

export INTERSECTIONS_PATH="$WORK/SAEVA-outputs/intersection/"
export OUTPUT_PATH='$WORK/SAEVA-outputs'


cd $WORK/SAEVA-outputs
export HIGH= `cat High.txt` 
export LOW=`cat Low.txt` 
export SOURCE_DIR="$WORK/SAEVA"

cd $WORK/SAEVA_reference_genome
tail -n+3 nctc8325.bed > nctc8325.bed
cd $WORK/SAEVA           
Rscript maincode.R $SOURCE_DIR $GENOME_BED_PATH $INTERSECTIONS_PATH ../InputFiles.csv $HIGH $LOW $OUTPUT_PATH
