import csv
import sys
if len(sys.argv) < 3:
    sys.stderr.write('No Input CSV file and freebayes\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
minicondaBin = sys.argv[2]

outputFile = "freebayes.sh"
with open(outputFile,'w') as outFile:
    count=0    
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0:
                outFile.write(f'{minicondaBin}freebayes -f $WORK/SANVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SANVA-outputs/picard/{row[0]}.picard.bam >$WORK/SANVA-outputs/freebayesoutput/{row[0]}.vcf\n')
            count =count +1
