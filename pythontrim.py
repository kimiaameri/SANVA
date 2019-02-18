import csv
import sys

if len(sys.argv) < 2:
    sys.stderr.write('No Input CSV file\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
outputFile = "trimmomatic.sh"
with open(outputFile,'w') as outFile:
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            outfile.write('\t trimmomatic PE -threads 4 -phred33 -trimlog $WORK/SAEVA-outputs/trimmomatic/trimlog/{row[0]}.trimlog {row[2]} {row[3]} $WORK/trimmomatic/{row[0]}-R1.paired.fq $WORK/trimmomatic/{row[0]}-R1.unpaired.fq $WORK/trimmomatic/{row[0]}-R2.paired.fq $WORK/trimmomatic/{row[0]}-R2.unpaired.fq\n')
            
 
