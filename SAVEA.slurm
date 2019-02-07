#!/bin/sh
#SBATCH --time=60:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=16384     # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=SAVEA
#SBATCH --error=SAVEA.%J.err
#SBATCH --output=SAVEA.%J.out
######## Trimmomatic #########
cd $WORK/project1
sh trimmomatic.sh
########### BWA  ###############
cd $WORK/SAEVA-outputs
mkdir samfiles
cd $WORK/project1
sh bwa.sh
###########  BAM ##################
cd $WORK/SAEVA-outputs
mkdir bamfiles
mkdir flagsam
mkdir sortsam
cd $WORK/project1
sh bam.sh
###########  Picard ##################
cd $WORK/SAEVA-outputs
mkdir picard
cd picard
mkdir picardlog
cd $WORK/project1
sh picard.sh
###########  Freebayes ##################
cd $WORK/SAEVA-outputs
mkdir freebayesoutput

cd $WORK/project1
sh freebayes.sh
###########  VCF-BCF ##################
cd $WORK/SAEVA-outputs
mkdir vcffilterq5000
mkdir bcfoutput
mkdir vcffilterq5000-dp250

cd $WORK/project1
sh BCF-VCF.sh
###########  snpEFF ##################
cd $WORK/SAEVA-outputs
mkdir snpEff-outputs
cd snpEff-outputs
mkdir snpEff-summary
mkdir snpEff-gene
cd $WORK/project1
sh snpEff.sh
