#!/bin/sh
#SBATCH --time=06:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=16384     # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=SAVEA
#SBATCH --error=free.%J.err
#SBATCH --output=free.%J.out

$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/HSS12071M1.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/HSS12071M1.vcf;

$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/Silverman94232M1_S14.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/Silverman94232M1_S14.vcf;

$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/Silverman99382M1_S15.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/Silverman99382M1_S15.vcf;

$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/Silverman99624D1_S16.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/Silverman99624D1_S16.vcf;

$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/Silverman62129B1_S17.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/Silverman62129B1_S17.vcf;

$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/Silverman60383B1_S18.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/Silverman60383B1_S18.vcf;

$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/Silverman93954A1_S19.picard.bam >$WORK/SAEVA-outputs/freebayesoutput//Silverman93954A1_S19.vcf;

$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/Silverman99624A1_S20.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/Silverman99624A1_S20.vcf;

$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/Silverman37712B1_S21.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/Silverman37712B1_S21.vcf;

$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/Silverman99382B1_S22.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/Silverman99382B1_S22.vcf;

$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/Silverman79414A1_S23.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/Silverman79414A1_S23.vcf;

