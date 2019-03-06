export GENOME_BED_PATH="$WORK/SAEVA_reference_genome/"
export INTERSECTIONS_PATH="$WORK/SAEVA-outputs/intersections/"
export OUTPUT_PATH='$WORK/SAEVA-outputs/'

python3 pythonIntersections.py ../InputFiles.csv $GENOME_BED_PATH
sh mapVCF-to-Bed.sh

$WORK/SAEVA-outputs
export HIGH= `cat High.txt` 
export LOW=`cat low.txt` 

Rscript maincode.R GITHUB_DIR GENOME_BED_PATH INTERSECTIONS_PATH ../InputFiles.csv HIGH LOW OUTPUT_PATH
