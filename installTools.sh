if [ -z $WORK ]; then WORK=`pwd`; fi



#######   Download softwares    #######
cd $WORK
mkdir SANVA-softwares
cd SANVA-softwares/
####      Bioconda          ####
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh
cd 
conda env create -f sanva.environment.yaml
conda activate sanva
