export GENOME_BED_PATH="$WORK/SAEVA_reference_genome/"

python3 pythonIntersections.py ../InputFiles.csv $GENOME_BED_PATH
sh mapVCF-to-Bed.sh

Rscript maincode.R GITHUB_DIR
