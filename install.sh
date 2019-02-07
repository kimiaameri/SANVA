####  Download reference genome    ####
cd $WORK
mkdir SAEVA_reference_genome
cd SAEVA_reference_genome
wget ftp://igenome:G3nom3s4u@ussd-ftp.illumina.com/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
tar -xzf Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
rm Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
cd ../
#######   Download softwares    #######
mkdir SAEVA-softwares
cd SAEVA-softwares
####   Download BWA       #####
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
