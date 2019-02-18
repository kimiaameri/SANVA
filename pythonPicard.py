import csv
import sys

if len(sys.argv) < 2:
    sys.stderr.write('No Input CSV file \n')
    sys.exit(0)
    

inputFile = sys.argv[1]
outputFile = "picard.sh"
with open(outputFile,'w') as outFile:
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            outFile.write(f'picard MarkDuplicates I=$WORK/SAEVA-outputs/sortsam/{row[0]}.sorted.bam O=$WORK/SAEVA-outputs/picard/{row[0]}.picard.bam M=$WORK/SAEVA-outputs/picard/picardlog/{row[0]}.picard.log\n')
