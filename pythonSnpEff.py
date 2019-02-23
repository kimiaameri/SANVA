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

sum(csv_reader.index == 17)
sum(csv_reader.index == 17)
sum(csv_reader.index == 17)


with open(outputFile,'w') as outFile:
     with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
         outFile.write(f'{minicondaBin}picard bcftools isec $WORK/SAEVA-outputs/bcfoutput/*.gz -p $WORK/SAEVA-outputs/All -n=length;\n')
         outFile.write(f'{minicondaBin}picard bcftools isec $WORK/SAEVA-outputs/bcfoutput/*.gz -p $WORK/SAEVA-outputs/All -n=11;\n')
         outFile.write(f'{minicondaBin}picard bcftools isec $WORK/SAEVA-outputs/bcfoutput/*.gz -p $WORK/SAEVA-outputs/All -n=11;\n')   
         outFile.write(f'sed -i 's/^chr/Chromosome/' $WORK/SAEVA-outputs/All/*.vcf;\n')
         outFile.write(f'sed -i 's/^chr/Chromosome/' $WORK/SAEVA-outputs/high/*.vcf;\n')
         outFile.write(f'sed -i 's/^chr/Chromosome/' $WORK/SAEVA-outputs/low/*.vcf;\n')
   
 outFile.write(f'{minicondaBin}picard bcftools isec $WORK/SAEVA-outputs/bcfoutput/*.gz -p $WORK/SAEVA-outputs/All -n=11;\n')

