if [ -z $WORK ]; then WORK=`pwd`; fi

####  Download reference genome    ####
cd $WORK
mkdir SAEVA_reference_genome
cd SAEVA_reference_genome
wget ftp://igenome:G3nom3s4u@ussd-ftp.illumina.com/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
tar -xzf Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
rm Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
cd ../
python GenomeBedPull.py $WORK/SAEVA_reference_genome
#######   Download softwares    #######
mkdir SAEVA-softwares
cd SAEVA-softwares
####      Bioconda          ####
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
conda install –c bioconda trimmomatic
conda install –c bioconda biopython
conda install –c bioconda bedops
conda install -c bioconda samtools/1.6
conda install -c bioconda picard
####   Download BWA       #####
cd $WORK/SAEVA-softwares

wget https://sourceforge.net/projects/bio-bwa/files/bwa-0.7.17.tar.bz2
tar -xvjf bwa-0.7.17.tar.bz2
rm bwa-0.7.17.tar.bz2
cd bwa-0.7.17
make
####   Download freebayes    #####
cd $WORK/SAEVA-softwares/
git clone --recursive git://github.com/ekg/freebayes.git
cd freebayes
make
####       Download VCF       #####
cd $WORK/SAEVA-softwares/freebayes/vcflib
make
####      Download snpEff      #####
cd $WORK/SAEVA-softwares/
wget http://sourceforge.net/projects/snpeff/files/snpEff_latest_core.zip
unzip snpEff_latest_core.zip
rm snpEff_latest_core.zip


###########################
echo `$WORK/SAEVA-softwares/freebayes/bin/freebayes --version`
