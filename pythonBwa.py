import csv
import sys

if len(sys.argv) < 2:
    sys.stderr.write('No Input CSV file \n')
    sys.exit(0)
    

inputFile = sys.argv[1]
minicondaBin = sys.argv[2]
outputFile = "bwa.sh"
with open(outputFile,'w') as outFile:
    outFile.write('#!/bin/sh \n')
    outFile.write('#SBATCH --time=168:00:00   # Run time in hh:mm:ss  \n')
    outFile.write('#SBATCH --mem-per-cpu=64gb  \n')
    # Maximum memory required per CPU (in megabytes')
    outFile.write('#SBATCH --job-name=BWA \n')
    outFile.write('#SBATCH --error=BWA.%J.err \n')
    outFile.write('#SBATCH --output=BWA.%J.out \n')  
    count =0
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0:
                outFile.write(f'{minicondaBin}bwa mem $WORK/SANVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SANVA-outputs/trimmomatic/{row[0]}-R1.paired.fq $WORK/SANVA-outputs/trimmomatic/{row[0]}-R2.paired.fq >$WORK/SANVA-outputs/samfiles/{row[0]}.sam\n')
            count =count+1
