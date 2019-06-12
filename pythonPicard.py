import csv
import sys
if len(sys.argv) < 3:
    sys.stderr.write('No Input CSV file and picard path\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
minicondaBin = sys.argv[2]

outputFile = "picard.sh"
with open(outputFile,'w') as outFile:
    count = 0
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0:
                 outFile.write(f'java -jar {minicondaBin}picard.jar MarkDuplicates I=$WORK/SANVA-outputs/sortsam/{row[0]}.sorted.bam O=$WORK/SANVA-outputs/picard/{row[0]}.picard.bam M=$WORK/SANVA-outputs/picard/picardlog/{row[0]}.picard.log\n')
            count=count+1
