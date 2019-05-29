#!/bin/sh
#SBATCH --time=80:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=64gb     # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=SAVEA
#SBATCH --error=SAVEA.%J.err
#SBATCH --output=SAVEA.%J.out
######## Trimmomatic #########
export MINICONDA_HOME="~/miniconda3/bin/"
export GITHUB_DIR=`pwd`
export SAMTools='$WORK/SANVA-softwares/samtools-1.5/'
export PICARD='$WORK/SANVA-softwares/picard/'
export FREEBAYES='$WORK/SANVA-softwares/freebayes/bin/'
export BCFTools='$WORK/SANVA-softwares/bcftools-1.8/'
cd $WORK
mkdir SANVA-outputs
cd SANVA-outputs
## make trimmomatic directory
mkdir trimmomatic
cd trimmomatic
mkdir trimlog
module load R
cd $WORK/SANVA
#### for SANVA if there is no adapter
python3 pythonTrimmomaticNoadapter.py ./InputFiles.csv $MINICONDA_HOME $GITHUB_DIR
##### For SANVA if there is adapter
#python3 pythonTrimmomatic.py ../InputFiles.csv $MINICONDA_HOME $GITHUB_DIR

sh trimmomatic.sh > $WORK/SANVA-outputs/trimmomatic.log
########### BWA  ###############
cd $WORK/SANVA-outputs
mkdir samfiles
cd $WORK/ACMBCB
python3 pythonBwa.py ../InputFiles.csv 
sh bwa.sh
###########  BAM ##################
cd $WORK/SANVA-outputs
mkdir bamfiles
mkdir flagsam
mkdir sortsam
mkdir depth
mkdir stats

cd $WORK/ACMBCB/

python3 pythonBam.py ./InputFiles.csv $SAMTools
sh bam.sh

###########  Picard ##################
cd $WORK/SANVA-outputs
mkdir picard
cd picard
mkdir picardlog
cd $WORK/ACMBCB/
python3 pythonPicard.py ./InputFiles.csv $PICARD

sh picard.sh
###########  Freebayes ##################
cd $WORK/SANVA-outputs
mkdir freebayesoutput

cd $WORK/ACMBCB/
python3 pythonFreebayes.py ./InputFiles.csv $FREEBAYES

sh freebayes.sh

########### Getting depth and qual for filtering ######

python3 pythonFinddepth.py ./InputFiles.csv $SAMTools 
sh findDepth.sh

Rscript depth.R $WORK/SANVA-outputs/depth/ $WORK/SANVA-outputs/freebayesoutput/ depth.txt quality.txt 
export DEPTH=$(( `cat depth.txt` * 1 ))
export QUALITY=$((`cat quality.txt` * 1 ))

###########  VCF-BCF ##################
cd $WORK/SANVA-outputs
mkdir vcffilter-q
mkdir bcfoutput
mkdir vcffilter-q-dp
cd $WORK/ACMBCB/
python3 pythonBCF_VCF.py ./InputFiles.csv $BCFTools $QUALITY $DEPTH
sh BCF-VCF.sh
###########  snpEFF Merge All Files ##################
cd $WORK/ACMBCB/
python3 pythonSnpEffMerge.py ./InputFiles.csv $BCFTools $MINICONDA_HOME $WORK/SANVA-outputs
sh snpEffMerge.sh


