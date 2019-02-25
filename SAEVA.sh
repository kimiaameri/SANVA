#!/bin/sh
#SBATCH --time=60:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=16384     # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=SAVEA
#SBATCH --error=SAVEA.%J.err
#SBATCH --output=SAVEA.%J.out
######## Trimmomatic #########
export MINICONDA_HOME="~/miniconda2/bin/"

cd $WORK
mkdir SAEVA-outputs
cd SAEVA-outputs
## make trimmomatic directory
mkdir trimmomatic
cd trimmomatic
mkdir trimlog

cd $WORK/SAEVA
python pythonTrimmomatic.py ../InputFiles.csv $MINICONDA_HOME

sh trimmomatic.sh
########### BWA  ###############
cd $WORK/SAEVA-outputs
mkdir samfiles
cd $WORK/SAEVA
python pythonBwa.py ../InputFiles.csv 
sh bwa.sh
###########  BAM ##################
cd $WORK/SAEVA-outputs
mkdir bamfiles
mkdir flagsam
mkdir sortsam
mkdir depth
cd $WORK/SAEVA

python pythonBam.py ../InputFiles.csv $MINICONDA_HOME
sh bam.sh
sh findDepth.sh


###########  Picard ##################
cd $WORK/SAEVA-outputs
mkdir picard
cd picard
mkdir picardlog
cd $WORK/SAVEA
python pythonPicard.py ../InputFiles.csv $MINICONDA_HOME

sh picard.sh
###########  Freebayes ##################
cd $WORK/SAEVA-outputs
mkdir freebayesoutput

cd $WORK/SAEVA
python pythonFreebayes.py ../InputFiles.csv 

sh freebayes.sh

########### Getting depth and qual for filtering ######

Rscript depth.R $WORK/SAEVA-outputs/depth $WORK/SAEVA-outputs/freebayesoutput depth.txt quality.txt summary.csv
DEPTH=`cat depth.txt`
QUALITY=`cat quality.txt`
python pythonFinddepth.py ../InputFiles.csv $MINICONDA_HOME $QUALITY $DEPTH


###########  VCF-BCF ##################
cd $WORK/SAEVA-outputs
mkdir vcffilterq
mkdir bcfoutput
mkdir vcffilterq-dp
mkdir vcfbed
cd $WORK/SAEVA
python pythonBCF_VCF.py ../InputFiles.csv $MINICONDA_HOME $QUALITY $DEPTH
sh BCF-VCF.sh
###########  snpEFF ##################
cd $WORK/SAEVA-outputs
mkdir snpEff-outputs
cd snpEff-outputs
mkdir snpEff-summary
mkdir snpEff-gene
cd $WORK/SAEVA
python pythonSnpEff.py ../InputFiles.csv $MINICONDA_HOME
sh snpEff.sh
