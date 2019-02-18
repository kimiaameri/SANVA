import csv
import sys

if len(sys.argv) < 2:
    sys.stderr.write('No Input CSV file \n')
    sys.exit(0)
    
inputFile = sys.argv[1]
outputFile = "BWA.sh"
with open(outputFile,'w') as outFile:
    with open(trimmomatic.sh) as txt_file:
        txt_reader = txt.reader(txt_file, delimiter='\n')
        for line in txt_reader:
            outFile.write(f'$WORK/SAEVA-softwares/bwa-0.7.17/bwa mem $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/SAEVA-outputs/trimmomatic/{row[0]}-R1.paired.fq $WORK/SAEVA-outputs/trimmomatic/{row[0]}-R2.paired.fq >$WORK/SAEVA-outputs/samfiles/{row[0]}.sam\n')
