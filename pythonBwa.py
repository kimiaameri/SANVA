import csv
import sys

if len(sys.argv) < 2:
    sys.stderr.write('No Input CSV file \n')
    sys.exit(0)
    

inputFile = sys.argv[1]
outputFile = "bwa.sh"
with open(outputFile,'w') as outFile:
    count =0
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0:
                outFile.write(f'$WORK/SAEVA-softwares/bwa-0.7.17/bwa mem $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/trimmomatic/{row[0]}-R1.paired.fq $WORK/SAEVA-outputs/trimmomatic/{row[0]}-R2.paired.fq >$WORK/SAEVA-outputs/samfiles/{row[0]}.sam\n')
            count =count+1
