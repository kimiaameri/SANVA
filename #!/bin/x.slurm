#!/bin/sh
#SBATCH --time=15:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=8192       # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=freebayes
#SBATCH --error=freebayes.%J.err
#SBATCH --output=freebayes.%J.out
$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/HSS12071M1.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/HSS12071M1.vcf;
