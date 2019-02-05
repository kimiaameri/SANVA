module load samtools/1.6
samtools view -bt $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/samfiles/aln_HSS12071M1_pool_S24.sam >$WORK/SAEVA-outputs/bamfiles/aln_HSS12071M1_pool_S24.bam
samtools flagstat $WORK/SAEVA-outputs/bamfiles/aln_HSS12071M1_pool_S24.bam> $WORK/SAEVA-outputs/flagsam/aln_HSS12071M1_pool_S24.flagstat.log
samtools sort $WORK/SAEVA-outputs/bamfiles/aln_HSS12071M1_pool_S24.bam -O bam -o $WORK/SAEVA-outputs/sortsam/aln_HSS12071M1_pool_S24.sorted.bam

samtools view -bt $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/samfiles/aln_Silverman94232M1_S14.sam >$WORK/SAEVA-outputs/bamfiles/aln_Silverman94232M1_S14.bam
samtools flagstat $WORK/SAEVA-outputs/bamfiles/aln_Silverman94232M1_S14.bam> $WORK/SAEVA-outputs/flagsam/aln_Silverman94232M1_S14.flagstat.log
samtools sort $WORK/SAEVA-outputs/bamfiles/aln_Silverman94232M1_S14.bam -O bam -o $WORK/SAEVA-outputs/sortsam/aln_Silverman94232M1_S14.sorted.bam

samtools view -bt $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/samfiles/aln_Silverman99382M1_S15.sam >$WORK/SAEVA-outputs/bamfiles/aln_Silverman99382M1_S15.bam
samtools flagstat $WORK/SAEVA-outputs/bamfiles/aln_Silverman99382M1_S15.bam> $WORK/SAEVA-outputs/flagsam/aln_Silverman99382M1_S15.flagstat.log
samtools sort $WORK/SAEVA-outputs/bamfiles/aln_Silverman99382M1_S15.bam -O bam -o $WORK/SAEVA-outputs/sortsam/aln_Silverman99382M1_S15.sorted.bam

samtools view -bt $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/samfiles/aln_Silverman99624D1_S16.sam >$WORK/SAEVA-outputs/bamfiles/aln_Silverman99624D1_S16.bam
samtools flagstat $WORK/SAEVA-outputs/bamfiles/aln_Silverman99624D1_S16.bam> $WORK/SAEVA-outputs/flagsam/aln_Silverman99624D1_S16.flagstat.log
samtools sort $WORK/SAEVA-outputs/bamfiles/aln_Silverman99624D1_S16.bam -O bam -o $WORK/SAEVA-outputs/sortsam/aln_Silverman99624D1_S16.sorted.bam

samtools view -bt $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/samfiles/aln_Silverman62129B1_S17.sam >$WORK/SAEVA-outputs/bamfiles/aln_Silverman62129B1_S17.bam
samtools flagstat $WORK/SAEVA-outputs/bamfiles/aln_Silverman62129B1_S17.bam> $WORK/SAEVA-outputs/flagsam/aln_Silverman62129B1_S17.flagstat.log
samtools sort $WORK/SAEVA-outputs/bamfiles/aln_Silverman62129B1_S17.bam -O bam -o $WORK/SAEVA-outputs/sortsam/aln_Silverman62129B1_S17.sorted.bam

samtools view -bt $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/samfiles/aln_Silverman60383B1_S18.sam >$WORK/SAEVA-outputs/bamfiles/aln_Silverman60383B1_S18.bam
samtools flagstat $WORK/SAEVA-outputs/bamfiles/aln_Silverman60383B1_S18.bam> $WORK/SAEVA-outputs/flagsam/aln_Silverman60383B1_S18.flagstat.log
samtools sort $WORK/SAEVA-outputs/bamfiles/aln_Silverman60383B1_S18.bam -O bam -o $WORK/SAEVA-outputs/sortsam/aln_Silverman60383B1_S18.sorted.bam

samtools view -bt $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/samfiles/aln_Silverman93954A1_S19.sam >$WORK/SAEVA-outputs/bamfiles/aln_Silverman93954A1_S19.bam
samtools flagstat $WORK/SAEVA-outputs/bamfiles/aln_Silverman93954A1_S19.bam> $WORK/SAEVA-outputs/flagsam/aln_Silverman93954A1_S19.flagstat.log
samtools sort $WORK/SAEVA-outputs/bamfiles/aln_Silverman93954A1_S19.bam -O bam -o $WORK/SAEVA-outputs/sortsam/aln_Silverman93954A1_S19.sorted.bam

samtools view -bt $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/samfiles/aln_Silverman99624A1_S20.sam >$WORK/SAEVA-outputs/bamfiles/aln_Silverman99624A1_S20.bam
samtools flagstat $WORK/SAEVA-outputs/bamfiles/aln_Silverman99624A1_S20.bam> $WORK/SAEVA-outputs/flagsam/aln_Silverman99624A1_S20.flagstat.log
samtools sort $WORK/SAEVA-outputs/bamfiles/aln_Silverman99624A1_S20.bam -O bam -o $WORK/SAEVA-outputs/sortsam/aln_Silverman99624A1_S20.sorted.bam

samtools view -bt $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/samfiles/aln_Silverman37712B1_S21.sam >$WORK/SAEVA-outputs/bamfiles/aln_Silverman37712B1_S21.bam
samtools flagstat $WORK/SAEVA-outputs/bamfiles/aln_Silverman37712B1_S21.bam> $WORK/SAEVA-outputs/flagsam/aln_Silverman37712B1_S21.flagstat.log
samtools sort $WORK/SAEVA-outputs/bamfiles/aln_Silverman37712B1_S21.bam -O bam -o $WORK/SAEVA-outputs/sortsam/aln_Silverman37712B1_S21.sorted.bam

samtools view -bt $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/samfiles/aln_Silverman99382B1_S22.sam >$WORK/SAEVA-outputs/bamfiles/aln_Silverman99382B1_S22.bam
samtools flagstat $WORK/SAEVA-outputs/bamfiles/aln_Silverman99382B1_S22.bam> $WORK/SAEVA-outputs/flagsam/aln_Silverman99382B1_S22.flagstat.log
samtools sort $WORK/SAEVA-outputs/bamfiles/aln_Silverman99382B1_S22.bam -O bam -o $WORK/SAEVA-outputs/sortsam/aln_Silverman99382B1_S22.sorted.bam

samtools view -bt $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/samfiles/aln_Silverman79414A1_S23.sam >$WORK/SAEVA-outputs/bamfiles/aln_Silverman79414A1_S23.bam
samtools flagstat $WORK/SAEVA-outputs/bamfiles/aln_Silverman79414A1_S23.bam> $WORK/SAEVA-outputs/flagsam/aln_Silverman79414A1_S23.flagstat.log
samtools sort $WORK/SAEVA-outputs/bamfiles/aln_Silverman79414A1_S23.bam -O bam -o $WORK/SAEVA-outputs/sortsam/aln_Silverman79414A1_S23.sorted.bam
