#!/bin/sh
#SBATCH --time=30:00:00
#SBATCH --mem-per-cpu=8046
#SBATCH --job-name=PermutationTest
#SBATCH --error=PermutationTest.%J.stderr
#SBATCH --output=PermutationTest.%J.stdout

python GenomeBed.py

cd $WORK/SAEVA-outputs
mkdir vcfbed
cd $WORK/project1
sh vcfBed.sh

module load R/3.5
Rscript maincode.R
