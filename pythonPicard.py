import csv
import sys
if len(sys.argv) < 3:
    sys.stderr.write('No Input CSV file and miniconda path\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
minicondaBin = sys.argv[2]

outputFile = "picard.sh"
with open(outputFile,'w') as outFile:
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            outFile.write(f'{minicondaBin}picard MarkDuplicates I=$WORK/SAEVA-outputs/sortsam/{row[0]}.sorted.bam O=$WORK/SAEVA-outputs/picard/{row[0]}.picard.bam M=$WORK/SAEVA-outputs/picard/picardlog/{row[0]}.picard.log\n')
