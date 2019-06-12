import csv
import sys

if len(sys.argv) < 5:
    sys.stderr.write('not enough input file: No Input CSV file or bcftools  or qulaity or depth \n')
    sys.exit(0)
    
inputFile = sys.argv[1]
minicondaBin = sys.argv[2]
quality = sys.argv[3]
depth= sys.argv[4]
outputFile = "BCF-VCF.sh"
with open(outputFile,'w') as outFile:
    count=0
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0:
                outFile.write(f'{minicondaBin}vcffilter -f "QUAL >{quality}" $WORK/SANVA-outputs/freebayesoutput/{row[0]}.vcf >$WORK/SANVA-outputs/vcffilter-q/{row[0]}.vcf\n')
                outFile.write(f'{minicondaBin}vcffilter -f "DP > {depth}" $WORK/SANVA-outputs/vcffilter-q/{row[0]}.vcf > $WORK/SANVA-outputs/vcffilter-q-dp/{row[0]}.vcf\n')
                outFile.write(f'{minicondaBin}bcftools view -Ob $WORK/SANVA-outputs/vcffilter-q-dp/{row[0]}.vcf > $WORK/SANVA-outputs/bcfoutput/{row[0]}.vcf.gz\n')NN
                outFile.write(f'{minicondaBin}bcftools index $WORK/SANVA-outputs/bcfoutput/{row[0]}.vcf.gz\n')N
            count =count + 1
 
