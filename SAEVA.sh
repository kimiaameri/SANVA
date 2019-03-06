#!/bin/sh
#SBATCH --time=80:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=16384     # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=SAVEA
#SBATCH --error=SAVEA.%J.err
#SBATCH --output=SAVEA.%J.out
######## Trimmomatic #########
export MINICONDA_HOME="~/miniconda3/bin/"
export GITHUB_DIR=`pwd`
export SAMTools='$WORK/SAEVA-softwares/samtools-1.5/'
export PICARD='$WORK/SAEVA-softwares/picard/'
export FREEBAYES='$WORK/SAEVA-softwares/freebayes/bin/'
export BCFTools='$WORK/SAEVA-softwares/bcftools-1.8/'
cd $WORK
mkdir SAEVA-outputs
cd SAEVA-outputs
## make trimmomatic directory
mkdir trimmomatic
cd trimmomatic
mkdir trimlog

cd $WORK/SAEVA
python3 pythonTrimmomatic.py ../InputFiles.csv $MINICONDA_HOME $GITHUB_DIR

sh trimmomatic.sh > $WORK/SAEVA-outputs/trimmomatic.log
########### BWA  ###############
cd $WORK/SAEVA-outputs
mkdir samfiles
cd $WORK/SAEVA
python3 pythonBwa.py ../InputFiles.csv 
sh bwa.sh
###########  BAM ##################
cd $WORK/SAEVA-outputs
mkdir bamfiles
mkdir flagsam
mkdir sortsam
mkdir depth
mkdir stats

cd $WORK/SAEVA/

python3 pythonBam.py ../InputFiles.csv $SAMTools
sh bam.sh

###########  Picard ##################
cd $WORK/SAEVA-outputs
mkdir picard
cd picard
mkdir picardlog
cd $WORK/SAEVA/
python3 pythonPicard.py ../InputFiles.csv $PICARD

sh picard.sh
###########  Freebayes ##################
cd $WORK/SAEVA-outputs
mkdir freebayesoutput

cd $WORK/SAEVA/
python3 pythonFreebayes.py ../InputFiles.csv $FREEBAYES

sh freebayes.sh

########### Getting depth and qual for filtering ######

python3 pythonFinddepth.py ../InputFiles.csv $SAMTools 
sh findDepth.sh

Rscript depth.R $WORK/SAEVA-outputs/depth/ $WORK/SAEVA-outputs/freebayesoutput/ depth.txt quality.txt 
export DEPTH= $(( `cat depth.txt` ))
export QUALITY=$((`cat quality.txt` * 1 ))

###########  VCF-BCF ##################
cd $WORK/SAEVA-outputs
mkdir vcffilter-q
mkdir bcfoutput
mkdir vcffilter-q-dp
mkdir vcfbed
cd $WORK/SAEVA/
python3 pythonBCF_VCF.py ../InputFiles.csv $BCFTools $QUALITY $DEPTH
sh BCF-VCF.sh
###########  snpEFF ##################
cd $WORK/SAEVA-outputs
mkdir snpEff-outputs
cd snpEff-outputs
mkdir snpEff-summary
mkdir snpEff-gene
cd $WORK/SAEVA/
python3 pythonSnpEff.py ../InputFiles.csv $BCFTools $MINICONDA_HOME $WORK/SAEVA-outputs
sh snpEff.sh
