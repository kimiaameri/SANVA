#!/bin/sh
#SBATCH --time=50:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=8192     # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=SAVEA
#SBATCH --error=SAVEA.%J.err
#SBATCH --output=SAVEA.%J.out
######## Trimmomatic #########
cd $WORK/project1
sh trimmomatic.sh
########### BWA  ###############
cd $WORK
mkdir SAEVA_reference_genome
cd SAEVA_reference_genome
wget ftp://igenome:G3nom3s4u@ussd-ftp.illumina.com/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
tar -xzf Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
rm Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
cd ../
mkdir SAEVA-softwares
cd SAEVA-softwares
wget https://sourceforge.net/projects/bio-bwa/files/bwa-0.7.17.tar.bz2
tar -xvjf bwa-0.7.17.tar.bz2
rm bwa-0.7.17.tar.bz2
cd bwa-0.7.17
make
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
cd $WORK/SAEVA-softwares/
git clone --recursive git://github.com/ekg/freebayes.git
cd freebayes
make
cd $WORK/project1
sh freebayes.sh
###########  VCF-BCF ##################
cd $WORK/SAEVA-outputs
mkdir vcffilterq5000
mkdir bcfoutput
mkdir vcffilterq5000-dp250cd $WORK/project1
sh picard.sh
