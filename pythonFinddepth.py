import csv
import sys

if len(sys.argv) < 3:
    sys.stderr.write('No Input CSV file and SAMTools\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
SAMTools = sys.argv[2] 
outputFile = "findDepth.sh"
with open(outputFile,'w') as outFile:
    count=0
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0:
                outFile.write(f'{SAMTools}samtools depth -a $WORK/SANVA-outputs/sortsam/{row[0]}.sorted.bam > $WORK/SANVA-outputs/depth/{row[0]}.depth\n')
            count =count + 1
