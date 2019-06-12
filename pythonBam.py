import csv
import sys

if len(sys.argv) < 3:
    sys.stderr.write('No Input CSV file and samtools\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
minicondaBin = sys.argv[2]
outputFile = "bam.sh"
with open(outputFile,'w') as outFile:
    count=0
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0 :
               outFile.write(f'{minicondaBin}/samtools view -bt $WORK/SANVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SANVA-outputs/samfiles/{row[0]}.sam >$WORK/SANVA-outputs/bamfiles/{row[0]}.bam\n')
               outFile.write(f'{minicondaBin}/samtools flagstat $WORK/SANVA-outputs/bamfiles/{row[0]}.bam > $WORK/SANVA-outputs/flagsam/{row[0]}.flagstat.log\n')
               outFile.write(f'{minicondaBin}/samtools sort $WORK/SANVA-outputs/bamfiles/{row[0]}.bam -O bam -o $WORK/SANVA-outputs/sortsam/{row[0]}.sorted.bam\n')
               outFile.write(f'{minicondaBin}/samtools stats $WORK/SANVA-outputs/sortsam/{row[0]}.sorted.bam >$WORK/SANVA-outputs/stats/{row[0]}.txt \n')

            count =count +1
 
