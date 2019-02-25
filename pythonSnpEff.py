import csv
import sys

if len(sys.argv) < 3:
    sys.stderr.write('No Input CSV file and miniconda path\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
minicondaBin = sys.argv[2]
outputFile = "SnpEff.sh"
csv_reader = csv.reader(csv_file, delimiter=',')
length = len(list(csv.reader(open('csv_reader'))))
for row in csv_reader:
    length= csv_reader.nrows
count(csv_reader[2].count(High)
highIndex =  [index for index, value in enumerate(csv_reader[2]) if value == "high"]
lowIndexx =  [index for index, value in enumerate(csv_reader[2]) if value == "low"]
high = len(highIndex)
low = len(lowIndex)
samples = csv_reader[1]
highSamples = samples[highIndex]
lowSamples = samples[lowIndex]

with open(outputFile,'w') as outFile:
     with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
         outFile.write(f'{minicondaBin}bcftools isec $WORK/SAEVA-outputs/bcfoutput/*.gz -p $WORK/SAEVA-outputs/All -n=length;\n')
         for samples in highSamples :
             outFile.write(f'{minicondaBin}bcftools isec $WORK/SAEVA-outputs/bcfoutput/{row[0]}.vcf.gz -p $WORK/SAEVA-outputs/high -n=high;\n')
         outFile.write(f'{minicondaBin}bcftools isec $WORK/SAEVA-outputs/bcfoutput/*.gz -p $WORK/SAEVA-outputs/low -n=low;\n') 
      
         outFile.write(f'sed -i 's/^chr/Chromosome/' $WORK/SAEVA-outputs/All/*.vcf;\n')
         outFile.write(f'sed -i 's/^chr/Chromosome/' $WORK/SAEVA-outputs/high/*.vcf;\n')
         outFile.write(f'sed -i 's/^chr/Chromosome/' $WORK/SAEVA-outputs/low/*.vcf;\n')
   
 outFile.write(f'{minicondaBin}bcftools isec $WORK/SAEVA-outputs/bcfoutput/*.gz -p $WORK/SAEVA-outputs/All -n=11;\n')

