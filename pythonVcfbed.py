import csv
import sys

if len(sys.argv) < 3:
    sys.stderr.write('No Input CSV file and miniconda path\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
minicondaBin = sys.argv[2]
outputFile = "vcfBed.sh"
with open(outputFile,'w') as outFile:
    count=0
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0:
                outFile.write(f'{minicondaBin}vcf2bed < $WORK/SAEVA-outputs/bcfoutput/{row[0]}.vcf > $WORK/SAEVA-outputs/vcfbed/{row[0]}.bed \n')
            count =count + 1
 
