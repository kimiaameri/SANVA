import csv
import sys
if len(sys.argv) < 2:
    sys.stderr.write('No Input CSV file \n')
    sys.exit(0)
    
inputFile = sys.argv[1]

outputFile = "freebayes.sh"
with open(outputFile,'w') as outFile:
    count=0    
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0:
                outFile.write(f'$WORK/SAEVA-softwares/freebayes/bin/freebayes -f $WORK/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/WholeGenomeFasta/genome.fa $WORK/SAEVA-outputs/picard/{row[0]}.picard.bam >$WORK/SAEVA-outputs/freebayesoutput/{row[0]}.vcf\n')
            count =count +1
